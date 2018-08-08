package cn.jxufe.imp;

import cn.jxufe.dao.SearchDAO;
import cn.jxufe.entity.Search;
import cn.jxufe.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LHM on 2018/8/7.
 */
@Service
public class SearchServiceImpl implements SearchService {
    @Autowired
    private SearchDAO searchDAO;

    @Override
    public List<Search> findAll() {
        return searchDAO.findAll();
    }
}
