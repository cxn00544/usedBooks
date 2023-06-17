package com.controller;

import com.mysql.cj.protocol.a.NativeConstants.IntegerDataType;
import com.pojo.Personal;
import com.pojo.SellBook;
import com.pojo.TBuyBook;
import com.service.SellBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class SellBookController {
    @Autowired
    @Qualifier(value="sellBookService")
    private SellBookService sellBookService;

    @RequestMapping("/doShowAllSellBook")
    public String doShowAllSellBook(Integer userId, Model model) {
        List<SellBook> list = sellBookService.getAllSellBookByUserId(userId);
        model.addAttribute("list", list);
        model.addAttribute("userId", userId);
        return "showsellbook";
    }

    // 添加出售商品的入口
    @RequestMapping("/addSellBook")
    public String addSellBook(Model model,int userId) {
    	model.addAttribute("userId", userId);
        return "sellbookadd";
    }
    
    @RequestMapping("/doBuyBook")
    public String doBuyBook(Integer bookId, Model model) {
    	SellBook sellBook = sellBookService.getSellBookById(bookId);
        model.addAttribute("sellBook", sellBook);
        System.out.println(sellBook);
        return "showSellBookDetailById";
    }

//	@RequestMapping(value="/personaladd",method=RequestMethod.POST)
//	public String addersonal(Personal personal,HttpSession session)  {
//		  Personal u = perSrv.ischeck(personal.getUserName());
//	      if (u == null) {
//	    		perSrv.addpersonal(personal);		
//	          return "zccg";
//	      }
//	  	session.setAttribute("zcMsg","用户名重复，请重新填写");		
//        return "zcsb";
//	  }
//    
    // 执行添加出售商品
    @RequestMapping("/doAddSellBook")
    public String doAddSellBook(HttpServletRequest request, Model model, SellBook sellBook,int userId) {
    	
    	sellBook.setUserId(userId);
    	SellBook k= sellBookService.checkisbn(sellBook.getIsbn());
    	  System.out.println(k);
        if (k !=null){
        	sellBookService.addSellBook(sellBook);
            List<SellBook> list = sellBookService.getAllSellBookByUserId(userId);
            model.addAttribute("list", list);
            return "showsellbook";
        }else{
            return "isbnerror";
        }

    }

    
    @RequestMapping("/doGetSellBookByKeyword")
    public String doGetSellBookByKeyword(Model model,String keyword) {
        List<SellBook> list = sellBookService.getSellBookByKeyword(keyword);
        model.addAttribute("list", list);
        return "showsellbook";
    }

    @RequestMapping("/doDeleteSellBook")
    public String doDeleteSellBook(Model model,int bookId,int userId) {
        if (sellBookService.deleteSellBook(bookId)){
            List<SellBook> list = sellBookService.getAllSellBookByUserId(userId);
            model.addAttribute("list", list);
            model.addAttribute("userId", userId);
            return "showsellbook";
        }else{
            return "error";
        }
    }
//    删除商品的同时生成订单
//    @RequestMapping("/doDeleteSellBookToIndex")
//    public String doDeleteSellBookToIndex(Model model,int bookId) {
////        if (sellBookService.deleteSellBook(bookId)){
////            List<SellBook> list = sellBookService.getAllSellBook();
////            model.addAttribute("list", list);
////            return "index";
////        }else{
////            return "error";
////        }
//    	
//    	
//    	return "noapymessage";
//    }

    @RequestMapping("/editSellBookById")
    public String editSellBookById(Model model,int bookId,int userId) {
        SellBook sellBook = sellBookService.getSellBookById(bookId);
        System.out.println(sellBook);
        model.addAttribute("sellBook", sellBook);
        model.addAttribute("userId", userId);
        return "sellbookedit";
    }

    @RequestMapping("/doUpdateSellBook")
    public String doUpdateSellBook(HttpServletRequest request,Model model,SellBook sellBook,int userId) {

            if (sellBookService.updateSellBook(sellBook)){
                List<SellBook> list = sellBookService.getAllSellBookByUserId(userId);
                model.addAttribute("list", list);
                model.addAttribute("userId", userId);
                return "showsellbook";
            }else{
                return "error";
            }

    }

    /**
     * 封装操作文件方法， 添加用户 和修改用户都会用到
     * @param file
     * @param filePath
     * @return
     */
//    private String fileOperate(MultipartFile file,String filePath) {
//        String originalFileName = file.getOriginalFilename();//获取原始图片的扩展名
//        System.out.println("图片原始名称："+originalFileName);
//        String newFileName = UUID.randomUUID() + "_" + originalFileName;  //新的文件名称
//        System.out.println("新的文件名称："+newFileName);
//        File targetFile = new File(filePath,newFileName); //创建新文件
//        try {
//            file.transferTo(targetFile); //把本地文件上传到文件位置 , transferTo()是springmvc封装的方法，用于图片上传时，把内存中图片写入磁盘
//        } catch (IllegalStateException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//        return newFileName;
//    }

}
