package cn.jxufe.controller;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Goods;

import cn.jxufe.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;


@Controller
@RequestMapping("goods")
public class GoodsController {

    @Autowired
    private GoodsService goodsService;

    @ResponseBody
    @RequestMapping("list")
    public List<Goods> getGoodses(){
        return goodsService.findByStatus();
    }

    @ResponseBody
    @RequestMapping("one")
    public Goods getGoods(int goodsId){
        return goodsService.findOne(goodsId);
    }

    @ResponseBody
    @RequestMapping("search_{goodsName}")
    public List<Goods> searchGoods(@PathVariable String goodsName){
        return goodsService.searchGoods(goodsName);
    }

    @ResponseBody
    @RequestMapping("publish")
    public Message add(Goods goods){
        return goodsService.add(goods);
    }

    @ResponseBody
    @RequestMapping("getByType")
    public List<Goods> getGoodsByType(int pageNo, int pageSize, int typeId,String sort,String order){
        String orders = sort + " " + order;
        return goodsService.findByType(pageNo, pageSize, typeId,orders);
    }
    @ResponseBody
    @RequestMapping("usergoods")
    public List<Goods> getGoodsByNickname(String nickname){
        return goodsService.findByNickname(nickname);
    }
}




