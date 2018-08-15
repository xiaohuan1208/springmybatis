package cn.jxufe.controller;

import cn.jxufe.bean.Message;
import com.aliyun.oss.OSSClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

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
    public Object upload(@RequestBody MultipartFile file){
        Message message = new Message();
        String endpoint = "http://oss-cn-beijing.aliyuncs.com";
        String accessKeyId = "LTAIUAD3kRsfXt0y";
        String accessKeySecret = "gpLbowd0hQTU4IxNd82V2WbsGARDvH";
        String buckName = "jxufespring";
        // 创建OSSClient实例。
        OSSClient ossClient = new OSSClient(endpoint, accessKeyId, accessKeySecret);
        // 上传文件流。
        try {
            InputStream inputStream = file.getInputStream();
            ossClient.putObject(buckName, file.getOriginalFilename(), inputStream);
            message.setCode(1);
            message.setMessage(endpoint.replace("http://","http://"+buckName+".")+"/"+file.getOriginalFilename());
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            ossClient.shutdown();
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
