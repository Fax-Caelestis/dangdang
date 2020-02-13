package com.lxx.controller;

import com.lxx.entity.DBook;
import com.lxx.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("book")
public class BookCOntroller {
    @Autowired
    BookService bookService;
    @RequestMapping("queryAll")
    public String queryAll(HttpServletRequest request){
        List<DBook> dBooks = bookService.queryAll();
        request.setAttribute("nook",dBooks);
        return "back/book/show";
    }
    //添加图书
    @RequestMapping("addBook")
    public String addBook(DBook dBook, MultipartFile cover){

        return "redirect:/book/queryAll";

    }
}
