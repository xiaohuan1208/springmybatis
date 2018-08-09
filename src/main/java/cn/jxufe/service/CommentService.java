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
    public Message addComment(Comment comment,HttpSession session);//添加评论
    public List<Comment> findByGoodsid(Integer goodsId);//根据对应的商品ID查找评论
}
