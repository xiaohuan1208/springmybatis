package cn.jxufe.dao;

import cn.jxufe.entity.Address;
import org.springframework.stereotype.Repository;

/**
 * AddressDAO继承基类
 */
@Repository
public interface AddressDAO extends MyBatisBaseDao<Address, Integer> {
}