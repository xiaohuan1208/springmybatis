package cn.jxufe.imp;

import cn.jxufe.dao.GoodsDAO;
import cn.jxufe.entity.Goods;
import cn.jxufe.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by LHM on 2018/8/7.
 */
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDAO goodsDAO;

    @Override
    public List<Goods> searchGoods(String goodsName) {
        List<Goods> list = goodsDAO.findByName(goodsName);
        return list;
    }
}
