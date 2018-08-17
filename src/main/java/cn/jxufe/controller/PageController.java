package cn.jxufe.controller;

import cn.jxufe.entity.Advertisement;
import cn.jxufe.entity.User;
import cn.jxufe.service.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by Administrator on 2018/8/2.
 */
@Controller
public class PageController {
    @Autowired
    private AdvertisementService advService;

    @RequestMapping("{url}")
    public String toPage(@PathVariable String url,HttpSession session,ModelMap modelMap){
        List<Advertisement> advertisements = advService.findAll();
        modelMap.put("adv",advertisements);
        User user = (User)session.getAttribute("user");
        if(user!=null){
            return url;
        }else{
            return "login";
        }
    }
    @RequestMapping("page_{url}")
    public String toIndex(@PathVariable String url,ModelMap modelMap){
        List<Advertisement> advertisements = advService.findAll();
        modelMap.put("adv",advertisements);
        return url;
    }


}

