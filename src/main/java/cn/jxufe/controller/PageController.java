package cn.jxufe.controller;

import cn.jxufe.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/8/2.
 */
@Controller
public class PageController {

    @RequestMapping("{url}")
    public String toPage(@PathVariable String url){
        return url;
    }



}

