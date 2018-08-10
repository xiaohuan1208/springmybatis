package cn.jxufe.controller;

import cn.jxufe.entity.Advertisement;
import cn.jxufe.service.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by 29596 on 2018/8/8.
 */
@Controller
@RequestMapping("adv")
public class AdvertisementController {
    @Autowired
    private AdvertisementService advService;

    @RequestMapping("list")
    @ResponseBody
    public List<Advertisement> getAdvs(){
        return advService.findAll();
    }
}
