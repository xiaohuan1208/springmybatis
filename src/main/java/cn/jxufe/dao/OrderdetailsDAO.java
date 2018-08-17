package cn.jxufe.dao;

import cn.jxufe.entity.Orderdetails;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * OrderdetailsDAO继承基类
 */
@Repository
public interface OrderdetailsDAO extends MyBatisBaseDao<Orderdetails, Integer> {
    public List<Orderdetails> findByOrderId(long orderId);
    public int deleteByOrderId(long orderId);
}