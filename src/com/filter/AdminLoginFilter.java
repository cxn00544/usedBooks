package com.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pojo.Admin;


@WebFilter("/admin/*")
public class AdminLoginFilter implements Filter {

    public AdminLoginFilter() { 
    }

	public void destroy() {
	}


	public void doFilter(ServletRequest servletrequest, ServletResponse servletresponse, FilterChain chain) throws IOException, ServletException {
		System.out.println("================正在过滤未登录者===================");
		HttpServletRequest request = (HttpServletRequest)servletrequest;
		HttpServletResponse response = (HttpServletResponse)servletresponse;
		HttpSession session = request.getSession();
		//判断用户是否登录
		if(session.getAttribute("adminInfo")!=null) {
			System.out.println("================已登录===================");
			chain.doFilter(request, response);
		}else {
			System.out.println("================未登录===================");
			response.sendRedirect("../adminLogin.jsp");
		}
		
		
	}


	public void init(FilterConfig fConfig) throws ServletException {
	}

}
