package com.briup.service;


import com.briup.bean.Shop;

import java.util.List;
public interface IShopService {
    List<Shop> findAllShops();
    Shop findShopById(Long id);
    List<Shop> findDiscount();
    List<Shop> recommendShop(Long userId);
    List<Shop> findByCategory(Long category);

    List<Shop> searchShop(String shopName);
}
