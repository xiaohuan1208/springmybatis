package cn.jxufe.imp;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.SearchDAO;
import cn.jxufe.entity.Search;
import cn.jxufe.entity.User;
import cn.jxufe.service.SearchService;
import com.github.pagehelper.PageHelper;
import jdk.nashorn.internal.ir.RuntimeNode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import sun.rmi.transport.proxy.HttpReceiveSocket;

import javax.security.auth.message.callback.SecretKeyCallback;
import javax.servlet.http.HttpSession;
import java.net.URI;
import java.util.List;

/**
 * Created by LHM on 2018/8/7.
 */
@Service
public class SearchServiceImpl implements SearchService {
    @Autowired
    private SearchDAO searchDAO;

    @Override
    public List<Search> findAll() {
        //User user = (User)session.getAttribute("user");
        String telphone = "13687091090";
        String orderBy = "createtime desc";
        PageHelper.startPage(1,6,orderBy);//只需要获取最新的前六条搜索记录
        return searchDAO.findByTelphone(telphone);
    }

    @Override
    public Message addSearch(String content,HttpSession session) {
        Message message = new Message();
        try{
            //User user = (User)session.getAttribute("user");
            Search search = new Search();
            search.setTelphone("13687091090");
            search.setContent(content);
            int result = searchDAO.insertSelective(search);
            if(result>0){
                message.setCode(10);
                message.setMessage("添加成功");
            }else{
                message.setCode(-10);
                message.setMessage("添加失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            message.setCode(-10);
            message.setMessage("添加失败");
        }
        return message;
    }

    @Override
    public Message deleteSearch(HttpSession httpSession) {
        Message message = new Message();
        try {
            //User user = (User)session.getAttribute("user");
            String telphone = "13687091090";
            int result = searchDAO.deleteByTelphone(telphone);
            if(result>0){
                message.setCode(10);
                message.setMessage("清除成功");
            }else{
                message.setCode(-10);
                message.setMessage("清除失败");
            }
        }catch (Exception e){
            e.printStackTrace();
            message.setCode(-10);
            message.setMessage("清除失败");
        }
        return message;
    }

}
