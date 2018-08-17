package cn.jxufe.controller;

import cn.jxufe.bean.Cart;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Registerinfo;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/6.
 */

/*
* 用户功能访问控制器
* */
@Controller
@RequestMapping("user")    //
public class UserController {
    @Autowired
    private UserService userService;

    /*
    * 用户登录
    * */
    @RequestMapping(value = "login")
    @ResponseBody
    public Message login(User user, HttpSession session){
        return userService.login(user,session);
    }

    /*
    * 用户注册
    * */
    @RequestMapping(value = "register")
    @ResponseBody
    public Message list(Registerinfo registerinfo, HttpSession session){
        return userService.register(registerinfo, session);
    }

    /**
     * 修改密码
     * @param oldPassword 旧密码
     * @param newPassword 新密码
     * @param session
     * @return
     */
   @RequestMapping(value = "change_pwd")
   @ResponseBody
   public Message change_pwd(String oldPassword, String newPassword,HttpSession session){
       return userService.change_pwd(oldPassword, newPassword, session);
   }

    /**
     * 修改用户名
     * @param nickname
     * @param session
     * @return
     */
    @RequestMapping(value = "change_name")
    @ResponseBody
    public Message change_name(String nickname,HttpSession session){
        return userService.change_name(nickname, session);
    }

    /**
     * 修改手机号码
     * @param telphone
     * @param session
     * @return
     */
    @RequestMapping(value = "change_tel")
    @ResponseBody
    public Message change_tel(String telphone,HttpSession session){
        return userService.change_tel(telphone, session);
    }

    /**
     * 找回密码
     * @param telphone
     * @param checkcode
     * @param password
     * @return
     */
    @RequestMapping(value = "find_pwd")
    @ResponseBody
    public Message find_pwd(String telphone,String checkcode,String password){
        return userService.find_pwd(telphone,checkcode,password);
    }

    /*
    * 获取用户session信息
    * */
    @RequestMapping(value = "information")
    @ResponseBody
    public User getUserinfo(HttpSession session){
        return userService.getUserinfo(session);
    }


    @RequestMapping("pushcart")
    @ResponseBody
    public Message pushCart(Cart cart, HttpSession session){
        return userService.pushCart(cart, session);
    }

    @RequestMapping("cart")
    @ResponseBody
    public Map<Integer,Cart> getCart(HttpSession session){
        return userService.getCart(session);
    }

    @RequestMapping("editcart")
    @ResponseBody
    public Message eidtCart(@RequestBody Cart[] cart,HttpSession session){
        return userService.eidtCart(cart,session);
    }

    @RequestMapping("img")
    @ResponseBody
    public Message updateImg(User user,HttpSession session){
        return userService.updateImg(user, session);
    }
}

