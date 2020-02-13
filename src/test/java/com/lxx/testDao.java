package com.lxx;

import com.lxx.dao.BookDao;
import com.lxx.dao.CategoryDao;
import com.lxx.entity.DCategory;
import com.lxx.service.CategoryService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@SpringBootTest(classes = DangdangApplication.class)
@RunWith(SpringRunner.class)
public class testDao {
    @Autowired
    CategoryDao categoryDao;
    @Autowired
    CategoryService categoryService;
    @Autowired
    BookDao bookDao;
    @Test
    public void test1(){
        List<DCategory> dCategories = categoryDao.queryAllOne();
        for (DCategory dCategory : dCategories) {
            System.out.println(dCategories);
        }
    }
}
