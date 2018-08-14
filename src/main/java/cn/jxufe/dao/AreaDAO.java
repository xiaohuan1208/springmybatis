package cn.jxufe.dao;

import cn.jxufe.entity.Area;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * AreaDAO继承基类
 */
@Repository
public interface AreaDAO extends MyBatisBaseDao<Area, Integer> {
    /**
     * 查询所有地址
     * @return
     */
    public List<Area> findAll();
    /**
     * 通过首字母查询地区信息
     * @return
     */
    public List<Area> findByPinyin(String pinyin);
    /**
     * 查询热门城市
     * @return
     */
    public List<Area> findHotCity();
}