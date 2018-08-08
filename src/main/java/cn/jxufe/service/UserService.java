package cn.jxufe.service;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Registerinfo;
import cn.jxufe.entity.User;

import javax.servlet.http.HttpSession;

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
}

