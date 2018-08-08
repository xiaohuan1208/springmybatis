package cn.jxufe.dao;

import cn.jxufe.entity.Comment;
import org.springframework.stereotype.Repository;

/**
 * CommentDAO继承基类
 */
@Repository
public interface CommentDAO extends MyBatisBaseDao<Comment, Integer> {
}