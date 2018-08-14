package cn.jxufe.service;

import cn.jxufe.entity.Area;

import java.util.List;

/**
 * Created by LHM on 2018/8/13.
 */
public interface AreaService {
    /**
     * 查询所有的地点
     * @return
     */
    public List<Area> findAll();
    /**
     * 根据首字母查询所有的地点
     * @return
     */
    public List<Area> findByPinyin(String pinyin);
    /**
     * 查询热门城市
     * @return
     */
    public List<Area> findHotCity();
}
