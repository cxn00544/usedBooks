package com.controller;

import com.pojo.SellBook;
import com.pojo.TBuyBook;
import com.service.TBuyBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class TBuyBookController {
    @Autowired
    @Qualifier(value="tBuyBookService")
    private TBuyBookService tbookService;

    @RequestMapping("/tbuybook")
    public String doTbuybook(Model model) {
        List<TBuyBook> list = tbookService.getAllTBuyBook();
        model.addAttribute("list", list);
        return "tbuybook";
    }
    
    
    @RequestMapping("/doShowAllTBuyBook")
    public String doShowAllTBuyBook(Model model) {
        List<TBuyBook> list = tbookService.getAllTBuyBook();
        model.addAttribute("list", list);
        return "showalltbuybook";
    }
    
    @RequestMapping("/doShowAllTBuyBookByUserId")
    public String doShowAllTBuyBookByUserId(Integer userId, Model model) {
        List<TBuyBook> list = tbookService.getAllTBuyBookByUserId(userId);
        model.addAttribute("list", list);
        model.addAttribute("userId", userId);
        return "showalltbuybook";
    }

    @RequestMapping("/doShowTBuyBookDetail")
    public String doShowTBuyBookDetail(Model model,int demandId) {
        TBuyBook tbook = tbookService.getTBuyBookById(demandId);
        System.out.println(tbook);
        model.addAttribute("tbook", tbook);
        return "showTBuyBookDetailById";
    }

    @RequestMapping("/doShowTBuyBookDetailForModify")
    public String doShowTBuyBookDetailForModify(Model model,Integer demandId) {
        TBuyBook tbook = tbookService.getTBuyBookById(demandId);
        System.out.println(tbook);
        model.addAttribute("tbook", tbook);
        model.addAttribute("demandId", demandId);
        return "tbuybookedit";
    }

    @RequestMapping("/doUpdateTBuyBook")
    public String doUpdateTBuyBook(Model model,TBuyBook tbook,Integer demandId,int userId) {
        if (tbookService.updateTBuyBook(tbook)){
            List<TBuyBook> list = tbookService.getAllTBuyBookListByUserId(userId);
            System.out.println(222);
            model.addAttribute("list", list);
            return "showalltbuybook";
        }else{
            return "error";
        }
    }

    @RequestMapping("/doDeleteTBuyBook")
    public String doDeleteTBuyBook(Model model,int demandId,int userId) {
        if (tbookService.deleteTBuyBook(demandId)){
            List<TBuyBook> list = tbookService.getAllTBuyBookListByUserId(userId);
            model.addAttribute("list", list);
            return "showalltbuybook";
        }else{
            return "error";
        }
    }

    
  
    
    
    
    
    @RequestMapping("/doAddTBuyBook")
    public String doAddTBuyBook(Model model,TBuyBook tbook,Integer userId) {
        if (tbookService.addTBuyBook(tbook)){
        	System.out.println(tbook);
            List<TBuyBook> list = tbookService.getAllTBuyBookListByUserId(userId);;
            model.addAttribute("list", list);
            return "showalltbuybook";
        }else{
            return "error";
        }
    }


    @RequestMapping("/add")
    public String toAddTBuyBook(Integer userId,Model model) {
    	model.addAttribute("userId", userId);
        return "tbuybookadd";
    }

}
