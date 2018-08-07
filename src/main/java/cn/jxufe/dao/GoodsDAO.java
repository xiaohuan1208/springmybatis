package cn.jxufe.dao;

import cn.jxufe.entity.Goods;

import org.springframework.stereotype.Repository;




import java.util.List;


/**
 * GoodsDAO继承基类
 */
@Repository
public interface GoodsDAO extends MyBatisBaseDao<Goods, Integer> {

    /**
     * 通过关键字查询商品信息
     */
    public List<Goods> findByName(String goodsName);

}