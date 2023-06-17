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
import org.springframework.web.servlet.ModelAndView;


import com.pojo.BookItem;
import com.service.BookItemSrv;

@Controller
public class AdminBookItemController {
	@Autowired
	@Qualifier("BookItemSrvImpl")
	private BookItemSrv bookItemSrv;
	
	//局部异常捕获
		@ExceptionHandler({Exception.class})
		public ModelAndView handleException(Exception exp) {
			ModelAndView mv=new ModelAndView();
			mv.setViewName("admin/admin_bookItem");
			mv.addObject("msg", "操作出错！请检查输入内容是否正确\t出错信息："+exp.getMessage());
			List<BookItem> list=bookItemSrv.selectBookItemAll();
			mv.addObject("bookItemList",list);
			return mv;
		}
		
		@RequestMapping("/deleteBookItem")
		public ModelAndView deleteBookItem(String bookId,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
			ModelAndView mv=new ModelAndView();
			bookItemSrv.deleteBookItem(bookId);
			mv.addObject("msg","删除二手书成功！");
			List<BookItem> list=bookItemSrv.selectBookItemAll();
			mv.addObject("bookItemList",list);
			mv.setViewName("admin/admin_bookItem");
			return mv;
		}
		
		@RequestMapping("/updateBookItem")
		public String updateBookItem(BookItem bookItem,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
			bookItemSrv.updateBookItem(bookItem);
			model.addAttribute("msg","修改二手书成功！");
			List<BookItem> list=bookItemSrv.selectBookItemAll();
			model.addAttribute("bookItemList",list);
			String re = "admin/admin_bookItem";
			return re;
		}
		
		@RequestMapping("/selectBookItemByValue")
		public String selectBookItemByValue(String bookId,String ISBN,String userId,String sellDate_yy ,String sellDate_mm ,String sellDate_dd ,String introduction,String status,
										Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
			List<BookItem> list=bookItemSrv.selectBookItemByValue( bookId, ISBN, userId, sellDate_yy , sellDate_mm , sellDate_dd , introduction, status);		
			if(list.size()!=0) {
				model.addAttribute("msg","查找二手书成功！");
				model.addAttribute("bookItemList",list);
			}else {
				model.addAttribute("msg","查找二手书结果为空！");
			}
			String re = "admin/admin_bookItem";
			return re;
		}
		
		@RequestMapping("/selectBookItemAll")
		public String selectBookItemAll(Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
			List<BookItem> list=bookItemSrv.selectBookItemAll();
			request.setAttribute("bookItemList",list);
			model.addAttribute("bookItemList",list);
			String re = "admin/admin_bookItem";
			return re;
		}
		
		
}
