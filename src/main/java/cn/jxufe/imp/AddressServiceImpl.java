package cn.jxufe.imp;

import cn.jxufe.bean.Message;
import cn.jxufe.dao.AddressDAO;
import cn.jxufe.entity.Address;
import cn.jxufe.entity.User;
import cn.jxufe.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

/**
 * Created by 29596 on 2018/8/16.
 */
@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressDAO addressDAO;
    @Override
    public Address selectByTelphone(HttpSession session) {
        User user = (User)session.getAttribute("user");
        return addressDAO.selectByTelphone(user.getTelphone());
    }

    @Override
    public Message updateAddress(Address address, HttpSession session) {
        Message message = new Message();
        int result;
        User user = (User)session.getAttribute("user");
        address.setTelphone(user.getTelphone());
        address.setChecked(1);
        if (address.getId() == null){
            result = addressDAO.insertSelective(address);
        }else {
            result =  addressDAO.updateByPrimaryKeySelective(address);
        }
        if (result == 1){
            message.setCode(1);
            message.setMessage("地址修改成功！");
        }else {
            message.setCode(0);
            message.setMessage("地址修改失败！");
        }
        return message;
    }
}
