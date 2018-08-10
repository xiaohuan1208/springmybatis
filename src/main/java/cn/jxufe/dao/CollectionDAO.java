package cn.jxufe.dao;

import cn.jxufe.entity.Collection;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * CollectionDAO继承基类
 */
@Repository
public interface CollectionDAO extends MyBatisBaseDao<Collection, Integer> {
    /**
     * 通过电弧号码和商品ID查询相应的收藏信息
     * @return
     */
    public Collection findByTelphoneAndGoodsId(Collection collection);

    /**
     * 查找相应用户的收藏商品
     * @param telphone
     * @return
     */
    public List<Collection> findByTelphone(String telphone);
}