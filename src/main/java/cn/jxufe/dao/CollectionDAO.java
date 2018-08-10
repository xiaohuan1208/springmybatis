package cn.jxufe.dao;

import cn.jxufe.entity.Collection;
import cn.jxufe.entity.CollectionExample;
import org.springframework.stereotype.Repository;

/**
 * CollectionDAO继承基类
 */
@Repository
public interface CollectionDAO extends MyBatisBaseDao<Collection, Integer, CollectionExample> {
}