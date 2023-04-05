package com.briup.bean;

import lombok.Data;
import org.springframework.stereotype.Component;

@Data
@Component
public class ShopCar {
    private Long id;
    private int num;
    private Shop shop;
    private User user;

}
