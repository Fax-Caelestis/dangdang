package com.lxx.es;

import com.lxx.entity.Article;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;

public interface ArticleDao extends ElasticsearchRepository<Article,String> {
}
