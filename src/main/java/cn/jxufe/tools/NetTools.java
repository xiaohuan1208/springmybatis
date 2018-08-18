package cn.jxufe.tools;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

/**
 * Created by 29596 on 2018/8/14.
 */
public class NetTools {
    /**
     * 发送get请求通用方法
     * @return
     */
    public static String get(String url){
        HttpClient client = HttpClients.createDefault();
        HttpGet get = new HttpGet(url);
        HttpResponse response = null;
        try{
            response = client.execute(get);
            HttpEntity entity = response.getEntity();
            String responseTxt = EntityUtils.toString(entity, "UTF-8");
            return responseTxt;
        }catch (IOException e){
            e.printStackTrace();
            return null;
        }finally {
            get.releaseConnection();
        }
    }

    /**
     * 发送post请求通用方法
     * @return
     */
    public String post(String url,String jsonStr){
        HttpClient client = HttpClients.createDefault();
        HttpPost post = new HttpPost(url);
        post.addHeader("content-type","application/json;charset=utf-8");
        String postJson = jsonStr;
        post.setEntity(new StringEntity(postJson,"utf-8"));
        HttpResponse response = null;
        HttpEntity entity = null;
        try {
            response = client.execute(post);
            entity = response.getEntity();
            String txt = EntityUtils.toString(entity,"utf-8");


            return txt;
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }finally {
            post.releaseConnection();
        }
    }
}
