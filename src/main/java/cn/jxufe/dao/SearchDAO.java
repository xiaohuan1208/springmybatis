package cn.jxufe.dao;

import cn.jxufe.entity.Search;
import org.springframework.stereotype.Repository;

/**
 * SearchDAO继承基类
 */
@Repository
public interface SearchDAO extends MyBatisBaseDao<Search, String> {
}