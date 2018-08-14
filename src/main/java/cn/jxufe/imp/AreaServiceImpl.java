package cn.jxufe.imp;

import cn.jxufe.dao.AreaDAO;
import cn.jxufe.entity.Area;
import cn.jxufe.service.AreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LHM on 2018/8/13.
 */
@Service
public class AreaServiceImpl implements AreaService {
    @Autowired
    private AreaDAO areaDAO;

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
