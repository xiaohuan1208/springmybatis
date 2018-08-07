package cn.jxufe.dao;

import cn.jxufe.entity.Search;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * SearchDAO继承基类
 */
@Repository
public interface SearchDAO extends MyBatisBaseDao<Search, String> {
    /**
     * 查询所有的搜索记录
     */
    public List<Search> findAll();
}