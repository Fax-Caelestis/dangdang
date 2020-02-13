package com.lxx;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import tk.mybatis.spring.annotation.MapperScan;

@SpringBootApplication
@MapperScan("com.hyh.dao")
public class DangdangApplication {

    public static void main(String[] args) {
        SpringApplication.run(DangdangApplication.class, args);
    }

}
