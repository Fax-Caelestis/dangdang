package com.lxx.es;

import com.lxx.entity.Article;

import java.util.List;

public interface ArticleService {
    public void Add(Article article);
    //gao亮
    public List<Article> Highlight(String str);
}
