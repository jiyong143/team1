package kr.kh.team1.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;
import kr.kh.team1.pagination.PageMaker;
import kr.kh.team1.service.ProductService;

@Controller
public class CJYController {
	
	@Autowired
	ProductService productService; 


   @GetMapping("/product/list")  
   public String productList(Model model, int mNum, Criteria cri, String mName, String tName, HttpSession session) {
	   int maxPrice = productService.getMaxPrice(mNum,cri);
	   int minPrice = productService.getMinPrice(mNum,cri);
	   int avgPrice = productService.getAvgPrice(mNum,cri);
	   model.addAttribute("maxPrice",maxPrice);
	   model.addAttribute("minPrice",minPrice);
	   model.addAttribute("avgPrice",avgPrice);
	   ArrayList <ProductVO> productList = productService.getProductList(mNum, cri);
	   int totalCount = productService.getProductTotalCount(mNum, cri);
	   PageMaker pm = new PageMaker(3, cri, totalCount);
	   model.addAttribute("pm", pm);
	   model.addAttribute("pList",productList); 
	   model.addAttribute("num" , mNum); 
	   session.setAttribute("MName",mName); 
	   session.setAttribute("TName",tName);
	   return "/product/list";  

   }
  
}
