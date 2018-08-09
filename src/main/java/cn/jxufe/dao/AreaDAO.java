package cn.jxufe.dao;

import cn.jxufe.entity.Area;
import org.springframework.stereotype.Repository;

/**
 * AreaDAO继承基类
 */
@Repository
public interface AreaDAO extends MyBatisBaseDao<Area, Integer> {
}