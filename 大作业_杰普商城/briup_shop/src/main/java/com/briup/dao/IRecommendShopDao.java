package com.briup.dao;

import com.briup.bean.RecommendShop;

import java.util.List;
public interface IRecommendShopDao {
   List<RecommendShop> findByUserId(Long userId);
}
