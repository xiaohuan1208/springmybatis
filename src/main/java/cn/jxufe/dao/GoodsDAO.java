package cn.jxufe.dao;

import cn.jxufe.entity.Goods;

import org.springframework.stereotype.Repository;

/**
 * GoodsDAO继承基类
 */
@Repository
public interface GoodsDAO extends MyBatisBaseDao<Goods, Integer> {
}