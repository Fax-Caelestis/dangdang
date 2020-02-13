package com.lxx.service;

import com.lxx.entity.DCategory;

import java.util.List;

public interface CategoryService {
    //查询所有类别
    public List<DCategory> queryAll();
    //添加一级类别
    public void addOne(DCategory dCategory);
    //查询所有一级类别
    public List<DCategory> queryAllOne(DCategory dCategory);
    //查询所有二级类别
    public List<DCategory> queryAllTwo(DCategory dCategory);
    //添加二级类别
    public void addTwo(DCategory dCategory);
}
