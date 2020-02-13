package com.lxx.dao;

import com.lxx.entity.DCategory;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface CategoryDao extends Mapper<DCategory> {
    List<DCategory> queryAllOne();
    List<DCategory> queryAllTwo();
}
