package cn.jxufe.imp;

import cn.jxufe.dao.TypeDAO;
import cn.jxufe.entity.Type;
import cn.jxufe.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 29596 on 2018/8/10.
 */
@Service
public class TypeServiceImpl implements TypeService {
    @Autowired
    private TypeDAO typeDAO;

    @Override
    public List<Type> getTypeList() {
        return typeDAO.selectAll();
    }
}
