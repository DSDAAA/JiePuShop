package com.briup.bean.vo;
import com.briup.bean.Category;
import lombok.Data;

import java.util.List;
@Data
public class CategoryVO {
    private Long id;
    private String name;
    private List<Category> categories;

    public CategoryVO(Category category, List<Category> categories) {
        this.id=category.getId();
        this.name=category.getName();
        this.categories=categories;

    }
}
