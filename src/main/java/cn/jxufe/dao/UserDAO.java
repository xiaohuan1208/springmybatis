package cn.jxufe.dao;

import cn.jxufe.entity.User;

import org.springframework.stereotype.Repository;

/**
 * UserDAO继承基类
 */
@Repository
public interface UserDAO extends MyBatisBaseDao<User, String> {
}