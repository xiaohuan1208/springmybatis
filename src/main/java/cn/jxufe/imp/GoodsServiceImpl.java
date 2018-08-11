package cn.jxufe.imp;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.GoodsDAO;
import cn.jxufe.entity.Goods;
import cn.jxufe.service.GoodsService;
import com.github.pagehelper.PageHelper;
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
        return goodsDAO.findByName(goodsName);
    }

    @Override
    public List<Goods> findAll(){
        return goodsDAO.findAll();
    }

    @Override
    public List<Goods> findByStatus(){
        return goodsDAO.findByStatus();
    }

    @Override
    public Goods findOne(int goodsId){
        return goodsDAO.selectByPrimaryKey(goodsId);
    }

    @Override
    public List<Goods> findByType(int pageNo, int pageSize, int typeId) {
        PageHelper.startPage(pageNo,pageSize);
        return goodsDAO.findByType(typeId);
    }

    @Override
    public Message add(Goods goods) {
        Message message = new Message();
//        try{
//            goodsDAO.insertSelective(goods);
//            message.setCode(1);
//            message.setMessage("作品上传成功");
//        }catch (Exception e){
//            message.setCode(-1);
//            message.setMessage("上传失败，请重试");
//            e.getMessage();
//        }
        if(goodsDAO.insertSelective(goods)>0){
            message.setCode(1);
            message.setMessage("作品上传成功");
        }else {
            message.setCode(-1);
            message.setMessage("上传失败，请重试");
        }
        return message;
    }

}
