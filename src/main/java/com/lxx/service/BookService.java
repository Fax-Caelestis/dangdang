package com.lxx.service;

import com.lxx.entity.DBook;

import java.util.List;

public interface BookService {
    //查所有
    public List<DBook> queryAll();
    //差一个
    public DBook queryOne(DBook dBook);
    //添加
    public void insertOne(DBook dBook);
    //修改
    public void updateOne(DBook dBook);
    //删除
    public void deleteOne(DBook dBook);
}
