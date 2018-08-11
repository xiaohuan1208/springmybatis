package cn.jxufe.dao;

import cn.jxufe.entity.Search;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * SearchDAO继承基类
 */
@Repository
public interface SearchDAO extends MyBatisBaseDao<Search, String> {
    /*
     * 查询当前用户所有的搜索记录
     */
    public List<Search> findByTelphone(String telphone);
    /*
    * 添加搜索记录
     */
    public int addSearch(Search search);
    /*
    * 删除当前登录用户的搜索记录
     */
    public int deleteByTelphone(String telphone);
}