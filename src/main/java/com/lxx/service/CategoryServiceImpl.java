package com.lxx.service;

import com.lxx.dao.CategoryDao;
import com.lxx.entity.DCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    CategoryDao categoryDao;
    @Override
    public List<DCategory> queryAll() {
        return categoryDao.selectAll();
    }

    @Override
    public void addOne(DCategory dCategory) {
        dCategory.setId(UUID.randomUUID().toString());
        dCategory.setLevels(1);
        System.out.println(dCategory);
        categoryDao.insert(dCategory);
    }

    @Override
    public List<DCategory> queryAllOne(DCategory dCategory) {
        /*Example example = new Example(DCategory.class);
        example.createCriteria().andEqualTo("levels", 1);*/
        List<DCategory> categories = categoryDao.queryAllOne();
        return categories;
    }

    @Override
    public List<DCategory> queryAllTwo(DCategory dCategory) {
        return categoryDao.queryAllTwo();
    }

    @Override
    public void addTwo(DCategory dCategory) {
        dCategory.setId(UUID.randomUUID().toString());
        dCategory.setLevels(2);
        System.out.println(dCategory);
        categoryDao.insert(dCategory);
    }
}
