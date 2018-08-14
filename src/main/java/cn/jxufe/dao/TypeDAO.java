package cn.jxufe.dao;

import cn.jxufe.entity.Type;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TypeDAO继承基类
 */
@Repository
public interface TypeDAO extends MyBatisBaseDao<Type, Integer> {
    List<Type> selectAll();
}