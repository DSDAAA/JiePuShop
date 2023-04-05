package com.briup.dao;

import com.briup.bean.User;

public interface IUserDao{
    User findByLoginName(String loginName);
    void saveUser(User user);
}
