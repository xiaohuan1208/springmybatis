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

    public User getUserinfo(HttpSession session);

    /*将商品信息添加到session中*/
    public Message pushCart(Cart cart, HttpSession session);

    public Map<Integer,Cart> getCart(HttpSession session);

    public Message eidtCart(Cart[] cart,HttpSession session);
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
