package com.controller;

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

import com.pojo.Admin;
import com.pojo.Book;
import com.pojo.sp;
import com.service.AdminSrv;

@Controller
public class AdminInfoController {

	@Autowired
	@Qualifier("AdminSrvImpl")
	private AdminSrv adminSrv;

	// 局部异常捕获
	@ExceptionHandler({ Exception.class })
	public ModelAndView handleException(Exception exp) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/admin_info");
		mv.addObject("msg", "操作出错！请检查输入内容是否正确\t出错信息：" + exp.getMessage());
		return mv;
	}

	@RequestMapping("/updateAdmin")
	public String updateBook(Admin admin,Model model,HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		List list=adminSrv.updateAdmin(admin);
		if(list.size()!=0) {
			model.addAttribute("msg","修改个人信息成功！");
			Admin a=(Admin)list.get(0);
			request.getSession().setAttribute("adminInfo",a);
			request.setAttribute("adminInfo",a);
		}else {
			model.addAttribute("msg","修改个人信息失败！检查输入内容后重试");
		}
		String re = "admin/admin_info";
		return re;
	}
	
//	（管理员端）：
	 //返回所有意见反馈:
	   @RequestMapping("/findallsp")
	    public String findallsp( Model model){
List<sp> problem = adminSrv.selectspall();
model.addAttribute("problem", problem); // 往前端传List，通过el表达式 ${}可以获取到
return "admin/sp_admin";
}	
	   
	   //修改意见反馈状态

		 @RequestMapping("/updatestuss")
		  public String toupdatestuss(Model model,Integer spID) {	
			 adminSrv.upstuss(spID);
			    return "admin/header";   
			  }
	
		  //删除意见反馈
			
			@RequestMapping(value="/deletespp")
			public String deletesp(@RequestParam Integer spID,Model model) {
				adminSrv.deletesp(spID);
			return "admin/header";	
			}
//	
	

}
