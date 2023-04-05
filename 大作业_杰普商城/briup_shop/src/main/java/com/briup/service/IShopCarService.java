package com.briup.service;


import com.briup.bean.ShopCar;

import java.util.List;
public interface IShopCarService {
    List<ShopCar> findUserAllShopCar(Long userId);
    void saveShopCar(int num,Long userId,Long shopId);
    void deleteShopCar(Long id);
    void updateShopCar(Long id,int num);
    List<ShopCar> findShopCars(Long[] ids);
}
