package cn.jxufe.dao;

import cn.jxufe.entity.Type;
import org.springframework.stereotype.Repository;

/**
 * TypeDAO继承基类
 */
@Repository
public interface TypeDAO extends MyBatisBaseDao<Type, Integer> {
}