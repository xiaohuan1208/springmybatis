package cn.jxufe.dao;

import cn.jxufe.entity.Advertisement;
import org.springframework.stereotype.Repository;

/**
 * AdvertisementDAO继承基类
 */
@Repository
public interface AdvertisementDAO extends MyBatisBaseDao<Advertisement, Integer> {
}