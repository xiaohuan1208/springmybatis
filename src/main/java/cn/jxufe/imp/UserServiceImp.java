package cn.jxufe.imp;

import cn.jxufe.bean.Cart;
import cn.jxufe.bean.Message;
import cn.jxufe.bean.OrderInfo;
import cn.jxufe.dao.GoodsDAO;
import cn.jxufe.dao.OrderDAO;
import cn.jxufe.dao.OrderdetailsDAO;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.*;
import cn.jxufe.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;
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
    @Autowired
    private OrderDAO orderDAO;
    @Autowired
    private OrderdetailsDAO orderdetailsDAO;
    @Autowired
    private GoodsDAO goodsDAO;

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
        return map;
    }

    @Override
    public Message eidtCart(Cart[] cart, HttpSession session) {

        Message message = new Message();
        Map<Integer,Cart> cartMap = (Map<Integer,Cart>)session.getAttribute("cart");
        if(cartMap==null){
            cartMap=new HashMap<Integer,Cart>();
        }
        //清空购物车
        cartMap.clear();

        for (Cart c : cart){
            //放入商品
            cartMap.put(c.getGoodsId(),c);
            System.out.println(c);
        }

        //放入session
        session.setAttribute("cart", cartMap);
        message.setCode(1);
        message.setMessage("修改成功");
        return message;
    }

    @Override
    public Message addOrder(HttpSession session, List<OrderInfo> orderInfoList) {
        Message message = new Message();
        User user = (User)session.getAttribute("user");
        String telPhone = user.getTelphone();
        //生成订单编号
        long orderId = System.currentTimeMillis();
        Order order = new Order();
        order.setOrderid(orderId);
        order.setTelphone(telPhone);
        order.setOrderstate("0");//表示未支付
        Map<Integer,Cart> cartMap = (Map<Integer,Cart>)session.getAttribute("cart");
        try{
            for(OrderInfo orderInfo : orderInfoList){
                //只需要获取最后一个总金额
                order.setTotalprice(orderInfo.getTotalprice());
                //根据商品ID从购物车中找出相应的Cart实体bean
                Cart c = cartMap.get(orderInfo.getGoodsid());
                //删除购物车中相应的商品信息
                cartMap.remove(orderInfo.getGoodsid());
                //找出商品数量
                int num = c.getNumber();
                Orderdetails orderdetails = new Orderdetails();
                orderdetails.setOrderid(orderId);
                orderdetails.setGoodsid(orderInfo.getGoodsid());
                orderdetails.setAmount(num);
                orderdetails.setGoodsname(orderInfo.getGoodsname());
                orderdetails.setPrice(orderInfo.getPrice());
                //存入详细订单表
                int result2 = orderdetailsDAO.insertSelective(orderdetails);
                //修改商品库存
                //获取相应的商品信息
                Goods goods = goodsDAO.selectByPrimaryKey(c.getGoodsId());
                goods.setStock(goods.getStock()-num);
                int result3 = goodsDAO.updateByPrimaryKeySelective(goods);
            }
            int result1 = orderDAO.insertSelective(order);
            message.setCode(orderId);
            message.setMessage("下单成功");
        }catch (Exception e){
            e.printStackTrace();
            message.setCode(-10);
            message.setMessage("下单失败");
        }
        return message;
    }

    @Override
    public Message payOrder(Order order) {
        Message message = new Message();
        System.out.println(order);
        try{
            Order result = orderDAO.selectByPrimaryKey(order.getOrderid());
            result.setAddress(order.getAddress());
            result.setOrderstate("1");//订单状态设置为已支付
            result.setOrderremarks(order.getOrderremarks());
            int resValue = orderDAO.updateByPrimaryKeySelective(result);
            if(resValue>0){
                message.setCode(10);
                message.setMessage("支付成功");
            }else{
                message.setCode(-10);
                message.setMessage("支付失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            message.setCode(-10);
            message.setMessage("支付失败");
        }
        return message;
    }

    @Override
    public List<Order> findAll(HttpSession session,String orderState) {
        User user = (User)session.getAttribute("user");
        List<Order> orderList = null;
        if(user!=null){
            String telphone = user.getTelphone();
            //查找所有未支付订单
            orderList = orderDAO.findByTelphone(telphone,orderState);
            for(Order order : orderList){
                HashMap<Object,List<Orderdetails>> map = new HashMap<Object,List<Orderdetails>>();
                List<Orderdetails> orderdetailses = orderdetailsDAO.findByOrderId(order.getOrderid());
                map.put("orderdetails",orderdetailses);
                order.setOrderDetailMap(map);
            }
            return orderList;
        }
        return null;
    }

    @Override
    public Message deleteOrder(long orderid) {
        Message message = new Message();
        try{
            //恢复商品库存
            List<Orderdetails> orderdetailses = orderdetailsDAO.findByOrderId(orderid);
            for(Orderdetails o : orderdetailses){
                int goodsId = o.getGoodsid();
                int amount = o.getAmount();
                Goods goods = goodsDAO.selectByPrimaryKey(goodsId);
                goods.setStock(goods.getStock()+amount);
                int result3 = goodsDAO.updateByPrimaryKeySelective(goods);
            }
            //删除订单表信息
            int result1 = orderDAO.deleteByPrimaryKey(orderid);
            //删除订单详情表信息
            int result2 = orderdetailsDAO.deleteByOrderId(orderid);
            message.setCode(10);
            message.setMessage("取消成功");
        }catch (Exception e){
            e.printStackTrace();
            message.setCode(-10);
            message.setMessage("取消失败");
        }
        return message;
    }

    @Override
    public Message updateImg(User user,HttpSession session) {
        Message message = new Message();
        if (userDAO.updateImg(user)>0){
            message.setCode(1);
            message.setMessage("头像上传成功");
            try {
                User user1 = userDAO.selectByPrimaryKey(user.getTelphone());
                session.setAttribute("user",user1);
            }catch (Exception e){

            }
        }else {
            message.setCode(-1);
            message.setMessage("上传失败");
        }
        return message;
    }


}
