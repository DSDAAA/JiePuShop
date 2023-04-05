package com.briup.service;

import com.briup.bean.User;
public interface IUserService {
    /*
    登陆
     */
    User login(String name, String password)throws Exception;
    /*
    注册
     */
    void register(User user)throws Exception ;
}