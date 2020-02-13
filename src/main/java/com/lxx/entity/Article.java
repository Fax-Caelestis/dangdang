package com.lxx.entity;

import com.alibaba.fastjson.annotation.JSONField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.data.elasticsearch.annotations.Document;
import org.springframework.data.elasticsearch.annotations.Field;
import org.springframework.data.elasticsearch.annotations.FieldType;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;
import java.util.Date;
@Document(indexName = "dd",type = "article")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class Article implements Serializable {
    @Id
    private String id;
    @Field(type = FieldType.Text,analyzer ="ik_max_word")
    private String title;
    @Field(type = FieldType.Text)
    private String imgfile;
    @Field(type = FieldType.Text,analyzer ="ik_max_word")
    private String content;

    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "create_date")
    @Field(type = FieldType.Date)
    private Date createDate;

    @Column(name = "publish_date")
    @JSONField(format = "yyyy-MM-dd")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Field(type = FieldType.Date)
    private Date publishDate;
    @Field(type = FieldType.Integer)
    private String status;
    @Column(name = "guru_id")
    @Field(type = FieldType.Text)
    private String guruId;
    @Column(name = "file_name")
    @Field(type = FieldType.Text)
    private String filename;

}
