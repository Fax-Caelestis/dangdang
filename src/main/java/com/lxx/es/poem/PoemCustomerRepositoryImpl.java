package com.lxx.es.poem;


import com.lxx.entity.Article;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.index.query.QueryStringQueryBuilder;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.elasticsearch.search.sort.FieldSortBuilder;
import org.elasticsearch.search.sort.SortBuilder;
import org.elasticsearch.search.sort.SortOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.SearchResultMapper;
import org.springframework.data.elasticsearch.core.aggregation.AggregatedPage;
import org.springframework.data.elasticsearch.core.aggregation.impl.AggregatedPageImpl;

import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;

import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Repository
public class PoemCustomerRepositoryImpl implements PoemCustomerRepository {
    @Autowired
    ElasticsearchTemplate elasticsearchTemplate;



    @Override
    public List<Article> findByTermAndPageSortSourceHigh(String term) {
        //创建高亮器
        HighlightBuilder.Field field = new HighlightBuilder
                //指定所有字段高亮
                .Field("*")
                //关闭默认的高亮规则
                .requireFieldMatch(false)
                //前缀
                .preTags("<font color='red'>")
                //后缀
                .postTags("</font>");

        //排序  基于年龄的升序
        SortBuilder sortBuilder=new FieldSortBuilder("age").order(SortOrder.ASC);
        //多字段分词查询
        QueryStringQueryBuilder queryStringQueryBuilder = QueryBuilders.
                queryStringQuery(term)
                .field("author")
                .field("authorDes")
                .field("content")
                .field("title");
        //各种条件
        NativeSearchQuery nativeSearchQuery = new NativeSearchQueryBuilder()
                 //查询条件
                .withQuery(queryStringQueryBuilder)
                //分页
                .withPageable(PageRequest.of(0, 10))
                //排序
                .withSort(sortBuilder)
                //指定字段展示
                //.withFields("author")
                //高亮
                .withHighlightFields(field)
                .build();

        AggregatedPage<Article> poems = elasticsearchTemplate.queryForPage(nativeSearchQuery, Article.class, new SearchResultMapper() {
            @Override
            public <T> AggregatedPage<T> mapResults(SearchResponse searchResponse, Class<T> aClass, Pageable pageable) {
                //spring data 封装数据的方法 map---->Poem
                SearchHit[] hits = searchResponse.getHits().getHits();
                List<Article> poems = new ArrayList<>();
                for (SearchHit hit : hits) {
                    //原始数据
                    Map<String, Object> sourceAsMap = hit.getSourceAsMap();
                    //高亮数据

                    //如果有高亮则替换原始数据  如果没有则使用原始数据

                    Map<String, HighlightField> highlightFields = hit.getHighlightFields();
                    for (String s : highlightFields.keySet()) {
                        sourceAsMap.put(s, highlightFields.get(s).getFragments()[0].toString());
                    }
                    //将map转换为poem对象
                    Article poem = MapToPoem(sourceAsMap);
                    poems.add(poem);
                }
                //返回
                return new AggregatedPageImpl<T>((List<T>) poems);
            }

            @Override
            public <T> T mapSearchHit(SearchHit searchHit, Class<T> aClass) {
                return null;
            }
        });
        return poems.getContent();
    }

    public Article MapToPoem(Map<String, Object> sourceAsMap ){
        Article poem = new Article();
        poem.setId(sourceAsMap.get("id").toString());
        poem.setTitle(sourceAsMap.get("title").toString());
        poem.setContent(sourceAsMap.get("content").toString());
        poem.setFilename(sourceAsMap.get("filename").toString());
        //poem.setTitle(sourceAsMap.get("title").toString());
        return poem;
    }
}
