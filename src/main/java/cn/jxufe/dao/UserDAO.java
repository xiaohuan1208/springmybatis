package cn.jxufe.dao;

import cn.jxufe.entity.User;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

/**
 * UserDAO继承基类
 */
@Repository
public interface UserDAO extends MyBatisBaseDao<User, String> {
    int updateByTel(@Param("telphone") String telphone,@Param("oldtel") String oldtel);

    int updateImg(User user);
}