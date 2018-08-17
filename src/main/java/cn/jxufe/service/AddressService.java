package cn.jxufe.service;

import cn.jxufe.entity.Address;

import javax.servlet.http.HttpSession;

/**
 * Created by 29596 on 2018/8/16.
 */
public interface AddressService {
    public Address selectByTelphone(HttpSession session);
}
