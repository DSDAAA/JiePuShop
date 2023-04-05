package com.briup.dao;

import com.briup.bean.ShopCar;

import java.util.List;
public interface IShopCarDao{
	ShopCar findByShopIdAndUserId(long shopId,long userId);

	void updateShopcar(int num,long id);

	List<ShopCar> findByUserId(long id);

	void deleteById(long id);

	void saveByshopIdUserId(int num,long shopId,long userId);

	List<ShopCar> findShopCarByIds(List<Long> list);
	void deleteShopCarByIds(List<Long> list);
}
