package cn.jxufe.imp;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.Registerinfo;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

/**
 * Created by Administrator on 2018/8/6.
 */
@Service
public class UserServiceImp implements UserService {

    public UserServiceImp(){
        System.out.println("UserServiceImp");
    }

    @Autowired
    private UserDAO userDAO;
    @Override
    public Message register(Registerinfo registerinfo, HttpSession session) {
        User user = new User();
        user.setTelphone(registerinfo.getTelphone());
        user.setPassword("123456");
        Message message = new Message();
        try {
            userDAO.insertSelective(user);
            message.setCode(1);
            message.setMessage("注册成功");
            session.setAttribute("user",user);
        }catch (Exception e){
            message.setCode(-1);
            message.setMessage("注册失败");
        }

        return message;
    }

    @Override
    public Message login(User user, HttpSession session) {

        Message message =new Message();

        User user1 =  userDAO.selectByPrimaryKey(user.getTelphone());
        if(user1 != null){
            if(user1.getPassword().equals(user.getPassword())){
                message.setCode(1);
                message.setMessage("登录成功");
                session.setAttribute("user",user1);
            }else{
                message.setCode(-1);
                message.setMessage("登录失败！密码错误");
            }
        }else{
            message.setCode(-1);
            message.setMessage("登录失败!没有该用户！");
        }
        return message;
    }

    @Override
    public User getUserinfo(HttpSession session) {

        User user = (User)session.getAttribute("user");
        return user;
    }
}
/*
代码手中走~佛祖心中留！求永无BUG！
                   _ooOoo_
                  o8888888o
                  88" . "88
                  (| -_- |)
                  O\  =  /O
               ____/`---'\____
             .'  \\|     |//  `.
            /  \\|||  :  |||//  \
           /  _||||| -:- |||||-  \
           |   | \\\  -  /// |   |
           | \_|  ''\---/''  |   |
            \  .-\__  `-`  ___/-. /
          ___`. .'  /--.--\  `. . __
       ."" '<  `.___\_<|>_/___.'  >'"".
      | | :  `- \`.;`\ _ /`;.`/ - ` : | |
      \  \ `-.   \_ __\ /__ _/   .-` /  /
 ======`-.____`-.___\_____/___.-`____.-'======
 */
