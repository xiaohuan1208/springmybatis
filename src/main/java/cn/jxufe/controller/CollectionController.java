package cn.jxufe.controller;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Collection;
import cn.jxufe.service.CollectionService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by LHM on 2018/8/10.
 */
@Controller
@RequestMapping("collection")
public class CollectionController {
    @Autowired
    private CollectionService collectionService;

    /**
     * 进行点赞收藏
     * @param goodsId
     * @param session
     * @return
     */
    @RequestMapping("addCollection_{goodsId}")
    @ResponseBody
    public Message addCollection(@PathVariable Integer goodsId,HttpSession session){
        System.out.println(goodsId);
        return collectionService.addCollection(goodsId,session);
    }

    @RequestMapping("getCollection")
    @ResponseBody
    public Object getCollection(@RequestParam(value = "page") Integer page,HttpSession session){
        return collectionService.findByTelphone(page,session);
    }
}
