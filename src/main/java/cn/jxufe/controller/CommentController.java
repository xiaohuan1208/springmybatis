package cn.jxufe.controller;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Comment;
import cn.jxufe.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;



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

    /**
     *
     * @param goodsId 商品ID
     * @param page 需要显示第几页
     * @return
     */
    @RequestMapping("getComment")
    @ResponseBody
    public Object getComment(@RequestParam(value = "goodsId") Integer goodsId,@RequestParam(value = "page") Integer page){
        return commentService.findByGoodsid(goodsId,page);
    }
}
