package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
//@ControllerAdvice则不需要在一个controller
@ControllerAdvice
public class GlobalExceptionHand{
	@ExceptionHandler(Exception.class)
	public ModelAndView handleEx(Exception ex) {
		ModelAndView mv=new ModelAndView();
		mv.setViewName("errors");
		mv.addObject("errorMsg", "全局异常处理："+ex.getMessage());
		return mv;
	}
	
}
