package com.briup.service;

import com.briup.bean.Collect;
import com.briup.bean.User;

import java.util.List;
public interface ICollectService {
    List<Collect> findUserAllCollect(Long id);
    void deleteCollect(Long userId,Long shopId);
    void deleteCollect(Long id);

    void addCollect(User user, Long shopId);

    boolean findCollect(Long id, Long shopId);

    Collect findOne(Long collectId);
}
