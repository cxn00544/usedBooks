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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pojo.*;
import com.service.*;

@Controller
public class AdminUserLogoutController {

	@Autowired
	@Qualifier("UserSrvImpl")
	private UserSrv userSrv;

	// 局部异常捕获
	@ExceptionHandler({ Exception.class })
	public ModelAndView handleException(Exception exp) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/admin_userLogout");
		mv.addObject("msg", "操作出错！请检查输入内容是否正确\t出错信息：" + exp.getMessage());
		return mv;
	}
	
	@RequestMapping("/selectUserByUserId")
	public String selectUserByUserId(String userId,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		List<User> list=new ArrayList<>();
		if(userId!="") {
			list=userSrv.selectUserByUserId(userId);		
		}else {
			list=userSrv.selectUserAll();
		}
		if(list.size()!=0) {
			model.addAttribute("msg","查找可注销用户成功！");
			model.addAttribute("userList",list);
		}else {
			model.addAttribute("msg","查找无该可注销用户！");
		}
		String re = "admin/admin_userLogout";
		return re;
	}
	
	@RequestMapping("/deleteUserByUserId")
	public String deleteUserByUserId(String userId,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		userSrv.deleteUserByUserId(userId);
		model.addAttribute("msg","注销用户成功！");
		List<User> list=userSrv.selectUserAll();
		model.addAttribute("userList",list);
		String re = "admin/admin_userLogout";
		return re;
	}
	
	@RequestMapping("/deleteUserAll")
	public String deleteUserAll(Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		userSrv.deleteUserAll();
		model.addAttribute("msg","注销所有可注销用户成功！");
		List<User> list=userSrv.selectUserAll();
		model.addAttribute("userList",list);
		String re = "admin/admin_userLogout";
		return re;
	}

}
