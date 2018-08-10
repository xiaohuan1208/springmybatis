package cn.jxufe.imp;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.CollectionDAO;
import cn.jxufe.dao.GoodsDAO;
import cn.jxufe.entity.Collection;
import cn.jxufe.entity.Goods;
import cn.jxufe.entity.User;
import cn.jxufe.service.CollectionService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by LHM on 2018/8/10.
 */
@Service
public class CollectionServiceImpl implements CollectionService {

    @Autowired
    private CollectionDAO collectionDAO;
    @Autowired
    private GoodsDAO goodsDAO;
    @Override
    public Message addCollection(Integer goodsId,HttpSession session) {
        Message message = new Message();
        int result1=0,result2=0,result3;
        try{
            User userSession = (User)session.getAttribute("user");
            if(userSession!=null){
                String telPhone = userSession.getTelphone();
                Collection collection = new Collection();
                collection.setTelphone(telPhone);
                collection.setGoodsid(goodsId);
                collection.setStatus(true);
                //获取相应商品Id的信息
                Goods goods = goodsDAO.selectByPrimaryKey(goodsId);
                //先查询当前用户以前有没有收藏该商品
                Collection coll = collectionDAO.findByTelphoneAndGoodsId(collection);
                if(coll != null){//之前收藏过
                    if(coll.getStatus()==true){//取消收藏
                        //将商品表中的收藏（点赞）数数量减1
                        goods.setLikenumber(goods.getLikenumber() - 1);
                    }else{//收藏
                        //将商品表中的收藏（点赞）数数量加1
                        goods.setLikenumber(goods.getLikenumber() + 1);
                    }
                    //取反操作
                    coll.setStatus(!coll.getStatus());
                    result1 = collectionDAO.updateByPrimaryKeySelective(coll);
                }else{//之前没收藏过
                    //将收藏记录添加到收藏表中
                    result2 = collectionDAO.insert(collection);
                    //将商品表中的收藏（点赞）数数量加1
                    goods.setLikenumber(goods.getLikenumber() + 1);
                }
                result3 = goodsDAO.updateByPrimaryKeySelective(goods);
                if( (result1!=0 || result2!=0) && result3!=0){
                    message.setCode(10);
                    message.setMessage("操作成功");
                }else{
                    message.setCode(-10);
                    message.setMessage("操作失败");
                }
            }else{
                message.setCode(-10);
                message.setMessage("请先登录");
            }

        }catch (Exception e){
            e.printStackTrace();
            message.setCode(-10);
            message.setMessage("操作失败");
        }
        return message;
    }

    @Override
    public PageInfo<Collection> findByTelphone(Integer page, HttpSession session) {
        List<Collection> collectionList;
        PageInfo<Collection> pageInfo;
        User userSession = (User)session.getAttribute("user");
        try{
            List<Goods> goodsList = new ArrayList<Goods>();
            if(userSession!=null){
                PageHelper.startPage(page,5);//默认每页显示5条记录
                collectionList = collectionDAO.findByTelphone(userSession.getTelphone());
                for(Collection c : collectionList){
                    Goods goods = goodsDAO.selectByPrimaryKey(c.getGoodsid());
                    goodsList.add(goods);
                }
                pageInfo = new PageInfo(goodsList);
                return pageInfo;
            }
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return null;
    }
}
