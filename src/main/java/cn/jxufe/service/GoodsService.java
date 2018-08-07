package cn.jxufe.service;

import cn.jxufe.entity.Goods;

import java.util.List;

/**
 * Created by LHM on 2018/8/7.
 */
public interface GoodsService {
    /*
     * 搜索商品信息
     */
    public List<Goods> searchGoods(String goodsName);
}
