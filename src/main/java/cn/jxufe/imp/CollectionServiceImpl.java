package cn.jxufe.imp;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.CollectionDAO;
import cn.jxufe.entity.Collection;
import cn.jxufe.service.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by LHM on 2018/8/10.
 */
public class CollectionServiceImpl implements CollectionService {

    @Autowired
    private CollectionDAO collectionDAO;
    @Override
    public Message addCollection(Collection collection) {
        int result = collectionDAO.insert(collection);
        return null;
    }
}
