package cn.jxufe.controller;

import cn.jxufe.entity.Search;
import cn.jxufe.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * Created by LHM on 2018/8/7.
 */
@Controller
@RequestMapping("searchTable")
public class SearchController {
    @Autowired
    private SearchService searchService;

    @RequestMapping("getSearch")
    public Object getSearch(ModelMap map){
        try {
            //获取当前用户的搜索记录
            map.put("searchList",searchService.findAll());
        }catch (Exception e){
            e.printStackTrace();
            return "404";
        }
        return "search";
    }

    @RequestMapping("addSearch_{content}")
    @ResponseBody
    public Object addSearch(@PathVariable String content,HttpSession httpSession){
        return searchService.addSearch(content,httpSession);
    }

    @RequestMapping("deleteSearch")
    @ResponseBody
    public Object deleteSearch(HttpSession httpSession){
        return searchService.deleteSearch(httpSession);
    }
}
