package com.briup.dao;


import com.briup.bean.ShippingAddress;

import java.util.List;
public interface IShippingAddressDao{
    List<ShippingAddress> findByUserId(Long userId);
}
