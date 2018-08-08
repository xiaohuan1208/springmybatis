package cn.jxufe.dao;

import cn.jxufe.entity.Orderdetails;
import org.springframework.stereotype.Repository;

/**
 * OrderdetailsDAO继承基类
 */
@Repository
public interface OrderdetailsDAO extends MyBatisBaseDao<Orderdetails, String> {
}