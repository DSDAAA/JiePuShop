package com.briup.service;

import com.briup.bean.Order;
import com.briup.bean.User;

import java.util.List;
public interface IOrderService {

    List<Order> findUserAllOrders(Long userId);
    Order saveOrder(Long [] shopCarIds, User user, Long addressId);

    Order paySuccess(String orderId);

    Order findById(String orderId);
}
