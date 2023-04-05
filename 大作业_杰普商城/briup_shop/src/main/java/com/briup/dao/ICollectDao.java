package com.briup.dao;

import com.briup.bean.Collect;

import java.util.List;

public interface ICollectDao{
	List<Collect> findByUserId(long id);
	Collect deleteByShopIdAndUserId(long shopId, long userId);
    Collect findByUserIdAndShopId(Long userId, Long shopId);
}
