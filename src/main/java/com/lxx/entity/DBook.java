package com.lxx.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Id;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DBook {
  @Id
  private String id;
  private String bname;
  private String author;
  private double price;
  private double dprice;
  private String company;
  private Date pressdate;
  private String edition;
  private String isbn;
  private Date printdate;
  private String wordnum;
  private double dcount;
  private String categroyid;
  private String editorecommend;
  private String src;
  private String stock;
  private String impression;
  private String bsize;
  private String paper;
  private String pack;
  private String pagenum;
  private String contentabstortact;
  private String authorabstract;
  private String driector;
  private String mediacomentary;

}
