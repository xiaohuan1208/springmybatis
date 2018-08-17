package cn.jxufe.service;

import cn.jxufe.bean.Message;
import cn.jxufe.entity.Registerinfo;
import cn.jxufe.entity.WxUser;

import javax.servlet.http.HttpSession;

/**
 * Created by 29596 on 2018/8/15.
 */
public interface WxUserService {
    public Message register(String code, HttpSession session);
}
