package cn.jxufe.imp;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.Registerinfo;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public Message register(Registerinfo registerinfo) {
        User user = new User();
        user.setTelphone(registerinfo.getTelphone());
        user.setPassword("");
        user.setNickname("sb");
        Message message = new Message();
        if(userDAO.insert(user)>0){
            message.setCode(1);
            message.setMessage("注册成功");
        }else{
            message.setCode(-1);
            message.setMessage("注册失败");
        }
        return message;
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
