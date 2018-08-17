package cn.jxufe.imp;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.WxUserDAO;
import cn.jxufe.entity.WxUser;
import cn.jxufe.service.WxUserService;
import cn.jxufe.tools.NetTools;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

/**
 * Created by 29596 on 2018/8/15.
 */
@Service
public class WxUserServiceImpl implements WxUserService {
    @Autowired
    private WxUserDAO wxUserDAO;

    @Value("${appID}")
    private String appID;

    @Value("${appsecret}")
    private String appsecret;

    @Override
    public Message register(String code, HttpSession session) {
        Message message = new Message();
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid="+appID+"&secret="+appsecret+"&code="+code+"&grant_type=authorization_code";
        String jsonStr = NetTools.get(url);
        JSONObject object = JSON.parseObject(jsonStr);
        String accessToken = object.getString("access_token");
        String openid = object.getString("openid");
        String urls = "https://api.weixin.qq.com/sns/userinfo?access_token="+accessToken+"&openid="+openid+"&lang=zh_CN";
        jsonStr = NetTools.get(urls);
        WxUser wxuser = JSON.parseObject(jsonStr,WxUser.class);
        try {
            wxUserDAO.insertSelective(wxuser);
            message.setCode(1);
            message.setMessage("注册成功");
            session.setAttribute("user",wxuser);
        }catch (Exception e){
            message.setCode(-1);
            message.setMessage("注册失败");
        }
        return message;
    }
}
