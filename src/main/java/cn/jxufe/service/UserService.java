package cn.jxufe.service;

import cn.jxufe.bean.Cart;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Registerinfo;
import cn.jxufe.entity.User;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/6.
 */
public interface UserService {

    public Message register(Registerinfo registerinfo, HttpSession session);

    public Message login(User user, HttpSession session);

    public Message change_pwd(String oldPassword,String newPassword,HttpSession session);

    public Message change_name(String nickname,HttpSession session);

    public Message change_tel(String telphone,HttpSession session);

    public Message find_pwd(String telphone,String checkcode,String password);

    public User getUserinfo(HttpSession session);



    /*将商品信息添加到session中*/
    public Message pushCart(Cart cart, HttpSession session);

    public Map<Integer,Cart> getCart(HttpSession session);

    public Message eidtCart(Cart[] cart,HttpSession session);
}

