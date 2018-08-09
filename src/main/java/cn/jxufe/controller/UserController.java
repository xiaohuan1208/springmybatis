package cn.jxufe.controller;

import cn.jxufe.bean.Cart;
import cn.jxufe.bean.Message;
import cn.jxufe.entity.Registerinfo;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
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

        System.out.println(user.getTelphone());
        System.out.println(user.getPassword());
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
