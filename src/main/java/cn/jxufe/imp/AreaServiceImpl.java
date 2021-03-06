package cn.jxufe.imp;

import cn.jxufe.dao.AreaDAO;
import cn.jxufe.entity.Area;
import cn.jxufe.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 29596 on 2018/8/13.
 */
@Service
public class AreaServiceImpl implements AreaService {
    @Autowired
    private AreaDAO areaDAO;

    @Override
    public List<Area> getProvince(int parentId) {
        return areaDAO.getByParentId(parentId);
    }

    @Override
    public List<Area> getCity(int parentId) {
        return areaDAO.getByParentId(parentId);
    }

    @Override
    public List<Area> getDistrict(int parentId) {
        return areaDAO.getByParentId(parentId);
    }
    @Override
    public List<Area> findAll() {
        try {
            return areaDAO.findAll();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
    @Override
    public List<Area> findByPinyin(String pinyin) {
        try {
            return areaDAO.findByPinyin(pinyin);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<Area> findHotCity() {
        try{
            return areaDAO.findHotCity();
        }catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
