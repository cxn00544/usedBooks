package com.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.CollectBookOrv;
import com.pojo.*;
@Controller
public class collectBookComtroller {
//	收藏商品
	@Autowired
	@Qualifier(value="collectbookOrv")
	CollectBookOrv collectOrv;
//	增加收藏
	@RequestMapping(value="/addCollect")
	public String addCollect(HttpServletRequest request,Model model){
		String bookId = request.getParameter("bookId");
		String isbn = request.getParameter("isbn");
        String userId=request.getParameter("userId");
		
		CollectBook collectBookList=new CollectBook();
		collectBookList.setBookId(Integer.parseInt(bookId));
		collectBookList.setUserId(Integer.parseInt(userId));
		List<CollectBook> CollectBook = collectOrv.CollectBookByBookId(collectBookList);
		
		System.out.print(collectBookList);
  if (CollectBook.isEmpty()) {
       	collectOrv.addCollect(collectBookList);
//      	request.getSession().setAttribute("collect_msg","收藏成功!");
            return "redirect:/showallcollectByUserid?&userId="+userId;
       }
  
//  		request.getSession().setAttribute("collect_msg2","该商品已经在收藏列表中了，请勿重复收藏！");
  return "redirect:/showallcollectByUserid?&userId="+userId;
    }
//	取消收藏
	@RequestMapping(value="/deleteCollect")
	public String deleteCollect(HttpServletRequest request,Model model){

		HttpSession session = request.getSession( );		
		Personal user = (Personal)session.getAttribute("user");
		int userId1 = user.getUserId();
		
        String collectId = request.getParameter("collectId");
     
        int i = collectOrv.DeleteCollect(Integer.parseInt(collectId));
     
   
        System.out.print("取消收藏");
		
        return "redirect:/showallcollectByUserid?&userId="+userId1;
	}
//	显示用户所有的收藏信息
	@RequestMapping(value="/showallcollectByUserid")
	public String showallcollectByUserid(HttpServletRequest request,Model model) throws UnsupportedEncodingException {
		
		String userId=request.getParameter("userId");
		List<CollectBookDetail> collectBookList  = collectOrv.CollectBookDetailByUserId(Integer.parseInt(userId));

		

		 request.setAttribute("collectBookList", collectBookList);
		
		 return "collectBook";
	}
	
	
}

