package com.lxx.es;

import com.lxx.entity.Article;
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.index.query.QueryBuilders;
import org.elasticsearch.search.SearchHit;
import org.elasticsearch.search.SearchHits;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightBuilder;
import org.elasticsearch.search.fetch.subphase.highlight.HighlightField;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.core.ElasticsearchTemplate;
import org.springframework.data.elasticsearch.core.SearchResultMapper;
import org.springframework.data.elasticsearch.core.aggregation.AggregatedPage;
import org.springframework.data.elasticsearch.core.aggregation.impl.AggregatedPageImpl;
import org.springframework.data.elasticsearch.core.query.NativeSearchQuery;
import org.springframework.data.elasticsearch.core.query.NativeSearchQueryBuilder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    ArticleDao articleDao;
    @Autowired
    ElasticsearchTemplate elasticsearchTemplate;
    @Override
    public void Add(Article article) {
        articleDao.save(article);
    }

    @Override
    public List<Article> Highlight(String str) {
        // 构建高亮字段 通过高亮器构建
        HighlightBuilder.Field nameField = new HighlightBuilder
                // 哪些需要做高亮
                .Field("*")
                .preTags("<span style='color:red'>")
                .postTags("/<span>")
                .requireFieldMatch(false);
        // 搜索条件
        NativeSearchQuery nativeSearchQueryBuilder = new NativeSearchQueryBuilder()
        // QueryBuilers-->多种查询方式的构建工厂   多字段查询
        .withQuery(QueryBuilders.multiMatchQuery(str,"name","content"))
        // 分页
       // .withPageable()
                // 高亮字段配置
        .withHighlightFields(nameField)
        // 过滤器 --> 提高查询效率
        //.withFilter(boolQuery().mustNot(termQuery("name",filter)))
        .build();
        AggregatedPage<Article> articles = elasticsearchTemplate.queryForPage(nativeSearchQueryBuilder, Article.class, new SearchResultMapper() {
            @Override
            public <T> AggregatedPage<T> mapResults(SearchResponse response, Class<T> aClass, Pageable pageable) {
                // 查询的结果
                SearchHits searchHits = response.getHits();
                SearchHit[] hits = searchHits.getHits();
                // 保存需要返回的数据
                ArrayList<Article> books = new ArrayList<Article>();
                for (SearchHit hit : hits) {
                    Article article =new Article();
                    //原始map
                    Map<String, Object> sourceAsMap = hit.getSourceAsMap();
                    article.setId(sourceAsMap.get("id").toString());
                    article.setTitle(sourceAsMap.get("title").toString());
                    article.setContent(sourceAsMap.get("content").toString());
                    article.setFilename(sourceAsMap.get("filename").toString());
                    //高亮替换 !=null
                    Map<String, HighlightField> highlightFields = hit.getHighlightFields();
                    if(highlightFields.get("title").toString()!=null){
                        String titleHighlight = highlightFields.get("title").getFragments()[0].toString();
                        article.setTitle(titleHighlight);
                    }
                    if(highlightFields.get("content").toString()!=null){
                        String contentHighlight = highlightFields.get("content").getFragments()[0].toString();
                        article.setContent(contentHighlight);
                    }
                    if(highlightFields.get("filename").toString()!=null){
                        String filenameHighlight = highlightFields.get("filename").getFragments()[0].toString();
                        article.setFilename(filenameHighlight);
                    }
                    books.add(article);
                }
                // 返回封装结果
                return new AggregatedPageImpl<T>((List<T>)books);
            }

            @Override
            public <T> T mapSearchHit(SearchHit searchHit, Class<T> aClass) {
                return null;
            }
        });

        return articles.getContent();
    }
}
