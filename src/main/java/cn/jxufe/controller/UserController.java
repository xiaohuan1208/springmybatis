package cn.jxufe.controller;

import cn.jxufe.bean.Cart;
import cn.jxufe.bean.Message;
import cn.jxufe.bean.OrderInfo;
import cn.jxufe.entity.Goods;
import cn.jxufe.entity.Order;
import cn.jxufe.entity.Registerinfo;
import cn.jxufe.entity.User;
import cn.jxufe.service.UserService;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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

    /**
     * 提交订单（但是不付款）
     * @return
     */
    @RequestMapping("suborder")
    @ResponseBody
    public Message submitOrder(@RequestBody List<OrderInfo> orderInfo,HttpSession session){
        System.out.println("有一个请求来了");
        return userService.addOrder(session,orderInfo);
    }

    /**
     * 支付订单
     * @return
     */
    @RequestMapping("payorder")
    @ResponseBody
    public Message payOrder(@RequestBody Order order){
        System.out.println("有一个请求来了");
        return userService.payOrder(order);
    }

    /**
     * 获取当前用户所有的未支付订单
     */
    @RequestMapping("nopay")
    @ResponseBody
    public List<Order> noPay(String orderState,HttpSession session){
        return userService.findAll(session,orderState);
    }

    /**
     * 获取当前用户所有的已支付订单
     */
    @RequestMapping("ispay")
    @ResponseBody
    public List<Order> isPay(HttpSession session,String orderState){
        return userService.findAll(session,orderState);
    }
    /**
     * 获取当前用户所有的已完成订单
     */
    @RequestMapping("completeorder")
    @ResponseBody
    public List<Order> completeOrder(HttpSession session,String orderState){
        return userService.findAll(session,orderState);
    }

    /**
     * 取消订单
     */
    @RequestMapping("deleteorder")
    @ResponseBody
    public Message deleteOrder(long orderid){
        System.out.println(orderid);
        return userService.deleteOrder(orderid);
    }

    /**
     * 用户安全退出
     */
    @RequestMapping("logout")
    @ResponseBody
    public Message safeQuit(HttpSession session){
        return userService.safeQuit(session);
    }

}

