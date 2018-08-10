package cn.jxufe.controller;

import cn.jxufe.bean.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;

/**
 * Created by Administrator on 2018/8/10.
 */
/*文件上传控制器*/
@Controller
@RequestMapping("file")
public class FileController {
    @Autowired
    private HttpServletRequest request;

    @RequestMapping("upload")
    @ResponseBody
    public Message upload(@RequestBody MultipartFile file){
        Message message = new Message();
        if (!file.isEmpty()){
            String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/"
                    + file.getOriginalFilename();
            try{
                /*转存文件*/
                file.transferTo(new File(filePath));
                message.setCode(1);
                message.setMessage(file.getOriginalFilename());
            }catch (Exception e){
                message.setCode(-1);
                message.setMessage("文件上传失败！请重试。");
            }

        }
        return message;
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
