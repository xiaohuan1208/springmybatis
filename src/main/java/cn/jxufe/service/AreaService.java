package cn.jxufe.service;

import cn.jxufe.entity.Area;

import java.util.List;

/**
 * Created by 29596 on 2018/8/13.
 */
public interface AreaService {
    public List<Area> getProvince(int parentId);
    public List<Area> getCity(int parentId);
    public List<Area> getDistrict(int parentId);
}
