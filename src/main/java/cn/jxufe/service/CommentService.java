package cn.jxufe.service;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Comment;
import com.github.pagehelper.PageInfo;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by LHM on 2018/8/8.
 */
public interface CommentService {
    /**
     * 添加评论
     * @param comment 评论对象
     * @param session
     * @return
     */
    public Message addComment(Comment comment,HttpSession session);

    /**
     * 查询出每个商品的评论
     * @param goodsId 商品ID
     * @param page 要显示第几页的数据
     * @return
     */
    public PageInfo<Comment> findByGoodsid(Integer goodsId,Integer page);
}
