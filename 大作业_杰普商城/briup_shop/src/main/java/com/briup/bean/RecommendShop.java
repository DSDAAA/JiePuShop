package com.briup.bean;

import lombok.Data;
import org.springframework.stereotype.Component;

@Data
@Component
public class RecommendShop {
    private Long id;
    private User user;
    private Shop shops;
    private Double recommandValue;

}
