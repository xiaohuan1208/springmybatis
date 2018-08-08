package cn.jxufe.dao;

import cn.jxufe.entity.Order;
import org.springframework.stereotype.Repository;

/**
 * OrderDAO继承基类
 */
@Repository
public interface OrderDAO extends MyBatisBaseDao<Order, Integer> {
}