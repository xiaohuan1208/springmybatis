package cn.jxufe.service;

import cn.jxufe.entity.Goods;

import java.util.List;



public interface GoodsService {

    /*
    * 查找所有商品
    * */
    public List<Goods> findAll();

    /*
    * 根据id查找单个商品
    * */
    public Goods findOne(int goodsId);

}
