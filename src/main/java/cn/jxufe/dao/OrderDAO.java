package cn.jxufe.dao;

import cn.jxufe.entity.Order;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * OrderDAO继承基类
 */
@Repository
public interface OrderDAO extends MyBatisBaseDao<Order, Long> {
    /**
     * 查找当前登录用户的未支付订单
     * @param telphone
     * @return
     */
    public List<Order> findByTelphone(@Param("tel")String telphone,@Param("state")String orderstate);
}