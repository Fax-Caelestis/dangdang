package com.lxx.controller;

import com.lxx.entity.DCategory;
import com.lxx.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("category")
public class CategoryCOntroller {
    @Autowired
    CategoryService categoryService;
    @RequestMapping("queryAll")
    public String queryAll(HttpServletRequest request){
        List<DCategory> categoryList = categoryService.queryAll();
        request.setAttribute("categoryList",categoryList);
        System.out.println(categoryList);
        return "back/category/show";
    }
    //添加一级
    @RequestMapping("addOne")
    public String addOne(DCategory dCategory){
        categoryService.addOne(dCategory);
        return "redirect:/category/queryAll";
    }
    //查一级
    @RequestMapping("queryAllOne")
    public String queryAllOne(HttpServletRequest request){
        List<DCategory> dCategories = categoryService.queryAllOne(null);
        request.setAttribute("list",dCategories);
        //categoryService.addOne(dCategory);
        return "back/category/add-second";
    }

    //添加二级
    @RequestMapping("addTwo")
    public String addTwo(DCategory dCategory,String parentId){
        System.out.println(parentId);
        categoryService.addTwo(dCategory);
        return "redirect:/category/queryAll";
    }
    //查所有耳机
    @RequestMapping("queryAllTwo")
    public String queryAllTwo(HttpServletRequest request){
        List<DCategory> dCategories = categoryService.queryAllTwo(null);
        request.setAttribute("list2",dCategories);
        //categoryService.addOne(dCategory);
        return "back/book/add";
    }
}
