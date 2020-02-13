package com.lxx.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Id;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class DCategory {
  @Id
  private String id;
  private String cateName;
  private int count;
  private String parentId;
  @Column(name = "levels")
  private int levels;


}
