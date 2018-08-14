package cn.jxufe.dao;

import cn.jxufe.entity.Goods;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

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

    public List<Goods> findByType(@Param("typeId")int typeId,@Param("orders")String orders);
    /**
     * 查询全部商品
     */
    public List<Goods> findAll();
    /**
     * 通过状态查询全部商品
     */
    public List<Goods> findByStatus();
}