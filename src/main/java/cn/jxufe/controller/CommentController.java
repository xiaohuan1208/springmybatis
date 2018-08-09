package cn.jxufe.controller;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Comment;
import cn.jxufe.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * Created by LHM on 2018/8/8.
 */
@Controller
@RequestMapping("comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @RequestMapping("addComment")
    @ResponseBody
    public Message addComment(Comment comment,HttpSession session){
        return commentService.addComment(comment,session);
    }

    @RequestMapping("getComment_{goodsId}")
    @ResponseBody
    public List<Comment> getComment(@PathVariable Integer goodsId){
        System.out.println(goodsId);
        return commentService.findByGoodsid(goodsId);
    }
}
