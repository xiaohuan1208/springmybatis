package cn.jxufe.controller;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Collection;
import cn.jxufe.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by LHM on 2018/8/10.
 */
@Controller
public class CollectionController {
    @Autowired
    private CollectionService collectionService;

    @RequestMapping("addCollection")
    @ResponseBody
    public Message addCollection(Collection collection){
        return collectionService.addCollection(collection);
    }
}
