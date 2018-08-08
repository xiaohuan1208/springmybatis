package cn.jxufe.dao;

import cn.jxufe.entity.Article;
import org.springframework.stereotype.Repository;

/**
 * ArticleDAO继承基类
 */
@Repository
public interface ArticleDAO extends MyBatisBaseDao<Article, Integer> {
}