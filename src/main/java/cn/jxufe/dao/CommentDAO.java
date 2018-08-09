package cn.jxufe.dao;

import cn.jxufe.entity.Comment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * CommentDAO继承基类
 */
@Repository
public interface CommentDAO extends MyBatisBaseDao<Comment, Integer> {
    /*
     * 根据商品名查询对应的评论
     */
    public List<Comment> findByGoodsId(Integer goodsId);

}