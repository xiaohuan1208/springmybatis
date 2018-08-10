package cn.jxufe.imp;

import cn.jxufe.dao.AdvertisementDAO;
import cn.jxufe.entity.Advertisement;
import cn.jxufe.service.AdvertisementService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 29596 on 2018/8/8.
 */
@Service
public class AdvertisementServiceImpl implements AdvertisementService{
    @Autowired
    private AdvertisementDAO advertisementDAO;

    @Override
    public List<Advertisement> findAll() {
        return advertisementDAO.findAll();
    }
}
