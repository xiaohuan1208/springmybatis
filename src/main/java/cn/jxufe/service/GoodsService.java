package cn.jxufe.service;

import cn.jxufe.bean.Message;
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
    /*
    * 查找所有商品
    * */
    public List<Goods> findAll();

    /*
    * 根据id查找单个商品
    * */
    public Goods findOne(int goodsId);

    /*
    * 根据商品类型id分页查找商品
    * */
    public List<Goods> findByType(int pageNo, int pageSize,int typeId);
 }

    /*
    * 添加商品信息
    * */
    public Message add(Goods goods);
    /*
     * 查询上架商品
     */
    public List<Goods> findByStatus();
 }

