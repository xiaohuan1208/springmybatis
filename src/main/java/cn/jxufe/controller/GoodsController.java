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
        return goodsService.findAll();
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




