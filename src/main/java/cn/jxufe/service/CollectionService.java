package cn.jxufe.service;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Collection;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpSession;

/**
 * Created by LHM on 2018/8/10.
 */
public interface CollectionService {

    /**
     * 用户点赞 收藏
     * @param goodsid
     * @param session
     * @return
     */
    public Message addCollection(Integer goodsid,HttpSession session);

    /**
     * 通过用户账号查询收藏的商品
     * @param page
     * @param session
     * @return
     */
    public PageInfo<Collection> findByTelphone(Integer page,HttpSession session);

    /**
     * 通过商品id和用户账号获取是否点赞
     * @param collection
     * @return
     */
    public Message isLike(Collection collection, HttpSession session);

}
