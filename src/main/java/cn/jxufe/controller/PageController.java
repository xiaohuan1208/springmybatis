package cn.jxufe.controller;

import cn.jxufe.entity.Advertisement;
import cn.jxufe.entity.User;
import cn.jxufe.service.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Administrator on 2018/8/2.
 */
@Controller
public class PageController {
    @Autowired
    private AdvertisementService advService;

    @RequestMapping("{url}")
    public String toPage(@PathVariable String url){
        return url;
    }
    @RequestMapping("page_{url}")
    public String toIndex(@PathVariable String url,ModelMap modelMap){
        List<Advertisement> advertisements = advService.findAll();
        modelMap.put("adv",advertisements);
        return url;
    }
    @RequestMapping("/")
    public String toIndexs(@PathVariable String url,ModelMap modelMap){
        List<Advertisement> advertisements = advService.findAll();
        modelMap.put("adv",advertisements);
        return "index";
    }

}

