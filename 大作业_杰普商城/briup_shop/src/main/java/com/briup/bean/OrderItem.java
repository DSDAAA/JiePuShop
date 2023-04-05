package com.briup.bean;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Component;
@Data
@Component
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {
    private Long id;
    private Shop shop;
    private int num;
    private Order order;
    public  OrderItem(ShopCar shopCar){
        this.shop=shopCar.getShop();
        this.num=shopCar.getNum();
    }

    @Override
    public String toString() {
        return "OrderItem{" +
                "id=" + id +
                ", shop=" + shop +
                ", num=" + num +
                '}';
    }
}
