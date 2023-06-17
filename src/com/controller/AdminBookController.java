package com.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.Book;
import com.service.BookSrv;

@Controller
public class AdminBookController {
	
	@Autowired
	@Qualifier("BookSrvImpl")
	private BookSrv bookSrv;
	
	//局部异常捕获
	@ExceptionHandler({Exception.class})
	public ModelAndView handleException(Exception exp) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("admin/admin_book");
		mv.addObject("msg", "操作出错！请检查输入内容是否正确\t出错信息："+exp.getMessage());
		List<Book> list=bookSrv.selectBookAll();
		mv.addObject("bookList",list);
		return mv;
	}
	
	@RequestMapping("/addBook")
	public String addBook(Book book,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		bookSrv.addBook(book);
		List<Book> list=bookSrv.selectBookAll();
		model.addAttribute("bookList",list);
		model.addAttribute("msg","添加书籍成功！");
		String re = "admin/admin_book";
		return re;
	}
	
	@RequestMapping("/deleteBook")
	public ModelAndView deleteBook(String ISBNDel,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		bookSrv.deleteBook(ISBNDel);
		mv.addObject("msg","删除书籍成功！");
		List<Book> list=bookSrv.selectBookAll();
		mv.addObject("bookList",list);
		mv.setViewName("admin/admin_book");
		return mv;
	}
	
	@RequestMapping("/updateBook")
	public String updateBook(Book book,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		bookSrv.updateBook(book);
		model.addAttribute("msg","修改书籍成功！");
		List<Book> list=bookSrv.selectBookAll();
		model.addAttribute("bookList",list);
		String re = "admin/admin_book";
		return re;
	}
	
	@RequestMapping("/selectBookByValue")
	public String selectBookByValue(String key,String value,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		List<Book> list=new ArrayList<>();
		if(value!=null&&value!=""&&key!=null&&key!="") {
			switch(key) {
			case "ISBN":
				list=bookSrv.selectBookByISBN(value);
				break;
			case "bookTitle":
				list=bookSrv.selectBookByBookTitle(value);
				break;
			case "author":
				list=bookSrv.selectBookByAuthor(value);
				break;
			case "typeId":
				list=bookSrv.selectBookByTypeId(value);
				break;
			}
		}else{
			list=bookSrv.selectBookAll();
		}
		model.addAttribute("bookList",list);
		if(list.size()!=0) {
			model.addAttribute("msg","查找书籍成功！");
		}else {
			model.addAttribute("msg","查找书籍结果为空！");
		}
		
		String re = "admin/admin_book";
		return re;
	}
	
	@RequestMapping("/selectBookAll")
	public String selectBookAll(Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		List<Book> list=bookSrv.selectBookAll();
		model.addAttribute("bookList",list);
		String re = "admin/admin_book";
		return re;
	}

	
	
	
}
