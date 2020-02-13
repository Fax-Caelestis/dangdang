package com.lxx.service;

import com.lxx.dao.BookDao;
import com.lxx.entity.DBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class BookServiceImpl implements BookService {
    @Autowired
    BookDao bookDao;
    @Override
    public List<DBook> queryAll() {
        return bookDao.selectAll();
    }

    @Override
    public DBook queryOne(DBook dBook) {
        return bookDao.selectOne(dBook);
    }

    @Override
    public void insertOne(DBook dBook) {
        bookDao.insertSelective(dBook);
    }

    @Override
    public void updateOne(DBook dBook) {
        bookDao.updateByPrimaryKeySelective(dBook);
    }

    @Override
    public void deleteOne(DBook dBook) {
        bookDao.delete(dBook);
    }
}
