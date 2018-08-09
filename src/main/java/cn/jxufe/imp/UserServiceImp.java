package cn.jxufe.imp;

import cn.jxufe.bean.Cart;
import cn.jxufe.bean.Message;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.Registerinfo;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.misc.resources.Messages_sv;

import javax.jws.soap.SOAPBinding;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Message change_pwd(String oldPassword, String newPassword,HttpSession session) {
        Message message =new Message();
        User user = getUserinfo(session);
        if(user.getPassword().equals(oldPassword)){
            user.setPassword(newPassword);
            try {
                userDAO.updateByPrimaryKey(user);
                message.setCode(1);
                message.setMessage("密码修改成功！");
                session.setAttribute("user",user);
            }catch (Exception e){
                message.setCode(0);
                message.setMessage("密码修改失败！");
            }
        }else {
            message.setCode(-1);
            message.setMessage("密码不正确！");
        }
        return message;
    }

    @Override
    public Message change_name(String nickname, HttpSession session) {
        Message message =new Message();
        User user = getUserinfo(session);
        user.setNickname(nickname);
        try {
            userDAO.updateByPrimaryKey(user);
            message.setCode(1);
            message.setMessage("用户名修改成功！");
            session.setAttribute("user",user);
        }catch (Exception e){
            message.setCode(-1);
            message.setMessage("用户名修改失败！");
        }
        return message;
    }

    @Override
    public Message change_tel(String telphone, HttpSession session) {
        Message message = new Message();
        User user = getUserinfo(session);
        String oldtel = user.getTelphone();
        try {
            userDAO.updateByTel(telphone,oldtel);
            message.setCode(1);
            message.setMessage("手机号码修改成功！");
            user.setTelphone(telphone);
            session.setAttribute("user",user);
        }catch (Exception e){
            message.setCode(-1);
            message.setMessage("手机号码修改失败！");
        }
        return message;
    }

    @Override
    public Message find_pwd(String telphone, String checkcode, String password) {
        Message message = new Message();
        if(checkcode.equals("123456")){
            User user = userDAO.selectByPrimaryKey(telphone);
            if(user!=null){
                user.setPassword(password);
                int result = userDAO.updateByPrimaryKey(user);
                if(result==1){
                    message.setCode(1);
                    message.setMessage("成功找回密码！");
                }else {
                    message.setCode(-1001);
                    message.setMessage("找回密码失败！");
                }
            }else {
                message.setCode(-1);
                message.setMessage("该用户不存在！");
            }
        }else {
            message.setCode(-2);
            message.setMessage("验证码错误！");
        }
        return message;
    }

    @Override
    public User getUserinfo(HttpSession session) {

        User user = (User)session.getAttribute("user");
        return user;
    }

    /*将商品信息添加到购物车session中*/
    @Override
    public Message pushCart(Cart cart, HttpSession session) {

        Message message = new Message();

        Map<Integer,Cart> cartMap = (Map<Integer,Cart>)session.getAttribute("cart");
        if(cartMap==null){
            cartMap=new HashMap<Integer,Cart>();
        }

        //通过传入的商品ID查询购物车中是否存在购物商品
        Cart c = cartMap.get(cart.getGoodsId());
        if(c == null){
            cartMap.put(cart.getGoodsId(),cart);
        }else {
            c.setNumber(c.getNumber()+cart.getNumber());
            cartMap.put(c.getGoodsId(),c);
        }
        session.setAttribute("cart",cartMap);
        message.setCode(1);
        message.setMessage("添加成功");

        return message;
    }

    @Override
    public Map<Integer,Cart> getCart(HttpSession session) {
        Map<Integer,Cart> map = (Map<Integer,Cart>)session.getAttribute("cart");
        if(map == null){
            System.out.println("is null ++++++++++++++++");
        }

        return map;
    }
}
