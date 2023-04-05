package com.briup.dao;

import com.briup.bean.Category;

import java.util.List;
public interface ICategoryDao{
    List<Category> findByParentIdIsNull();
    List<Category> findByParentId(Long id);
}
