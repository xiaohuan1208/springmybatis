package cn.jxufe.imp;

import cn.jxufe.dao.GoodsDAO;
import cn.jxufe.entity.Goods;
import cn.jxufe.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/8/7.
 */

@Service
public class GoodsImp implements GoodsService {

    @Autowired
    private GoodsDAO goodsDAO;

    public List<Goods> findAll(){
        return goodsDAO.findAll();
    }

    public Goods findOne(int goodsId){
        return goodsDAO.selectByPrimaryKey(goodsId);
    }
}
/*
代码手中走~佛祖心中留！求永无BUG！
                   _ooOoo_
                  o8888888o
                  88" . "88
                  (| -_- |)
                  O\  =  /O
               ____/`---'\____
             .'  \\|     |//  `.
            /  \\|||  :  |||//  \
           /  _||||| -:- |||||-  \
           |   | \\\  -  /// |   |
           | \_|  ''\---/''  |   |
            \  .-\__  `-`  ___/-. /
          ___`. .'  /--.--\  `. . __
       ."" '<  `.___\_<|>_/___.'  >'"".
      | | :  `- \`.;`\ _ /`;.`/ - ` : | |
      \  \ `-.   \_ __\ /__ _/   .-` /  /
 ======`-.____`-.___\_____/___.-`____.-'======
 */
