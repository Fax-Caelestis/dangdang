package com.lxx.es.poem;

import com.lxx.entity.Article;

import java.util.List;

public interface PoemCustomerRepository {
    /*public List<Poem> findByTerm(String term);
    //关键词查询  分页
    public List<Poem> findByTermAndPage(String term);
    //关键词查询  分页  排序
    public List<Poem> findByTermAndPageSort(String term);
    //关键词查询  分页  排序  展示指定字段
    public List<Poem> findByTermAndPageSortSource(String term);*/
   //关键词查询  分页  排序  展示指定字段  高亮
   public List<Article> findByTermAndPageSortSourceHigh(String term);




}
