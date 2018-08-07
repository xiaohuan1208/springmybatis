package cn.jxufe.service;

import cn.jxufe.entity.Search;

import java.util.List;

/**
 * Created by LHM on 2018/8/7.
 */
public interface SearchService {
    public List<Search> findAll();//查询所有的搜索记录
}
