package cn.jxufe.dao;

import cn.jxufe.entity.Area;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * AreaDAO继承基类
 */
@Repository
public interface AreaDAO extends MyBatisBaseDao<Area, Integer> {
    List<Area> getByParentId(int parentId);
    List<Area> getByAreaName(String areaName);
}