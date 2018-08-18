package cn.jxufe.service;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Search;

import javax.servlet.http.HttpSession;
import java.awt.*;
import java.util.List;

/**
 * Created by LHM on 2018/8/7.
 */
public interface SearchService {
    public List<Search> findAll(HttpSession session);//查询所有的搜索记录
    public Message addSearch(String content,HttpSession session);//添加搜索记录
    public Message deleteSearch(HttpSession httpSession);//删除当前用户的搜索记录
}
