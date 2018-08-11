package cn.jxufe.imp;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.CommentDAO;
import cn.jxufe.dao.UserDAO;
import cn.jxufe.entity.Comment;
import cn.jxufe.entity.User;
import cn.jxufe.service.CommentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTML;
import java.util.List;

/**
 * Created by LHM on 2018/8/8.
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Autowired
    private CommentDAO commentDAO;
    @Autowired
    private UserDAO userDAO;

    @Override
    public Message addComment(Comment comment,HttpSession session) {
        Message message = new Message();
        try{
            User sessionUser = (User)session.getAttribute("user");
            if(sessionUser==null){
                message.setCode(-10);
                message.setMessage("请先登录");
            }else{
                comment.setTelphone(sessionUser.getTelphone());
                //comment.setTelphone("13687091090");
                //通过手机号获取评论人的信息
                User user = userDAO.selectByPrimaryKey(comment.getTelphone());
                comment.setNickname(user.getNickname());
                comment.setHeadimg(user.getHeadimg());
                int result = commentDAO.insert(comment);
                if(result>0){
                    message.setCode(10);
                    message.setMessage("评论成功");
                }else{
                    message.setCode(-10);
                    message.setMessage("评论失败");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
            message.setCode(-10);
            message.setMessage("评论失败");
        }
        return message;
    }

    @Override
    public PageInfo<Comment> findByGoodsid(Integer goodsId,Integer page) {
        List<Comment> commentList;
        PageInfo pageInfo;
        try{
            PageHelper.startPage(page,4);//默认每页显示四条记录
            PageHelper.orderBy("createtime desc");
            commentList = commentDAO.findByGoodsId(goodsId);
            pageInfo = new PageInfo(commentList);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
        return pageInfo;
    }
}
