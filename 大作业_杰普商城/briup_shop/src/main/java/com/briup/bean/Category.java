package com.briup.bean;

import lombok.Data;
import org.springframework.stereotype.Component;
@Data
@Component
public class Category {
    private Long id;
    private String name;
    private Long parentId;

}
