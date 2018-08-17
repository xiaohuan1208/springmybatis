package cn.jxufe.controller;

import cn.jxufe.entity.WxUser;
import cn.jxufe.service.WxUserService;
import cn.jxufe.tools.NetTools;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by 29596 on 2018/8/15.
 */
@Controller
public class WxController {
    @Autowired
    private WxUserService wxUserService;
    @RequestMapping("weixinUser")
    @ResponseBody
    public Object toIndex(@RequestParam(name="code",defaultValue = "") String code,HttpSession session){
        return wxUserService.register(code,session);
    }
}
