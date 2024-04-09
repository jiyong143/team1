package kr.kh.team1.controller;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.service.ProductService;

@Controller
public class CJYController {
	
	@Autowired 
	ProductService productService; 


   @GetMapping("/product/list") 
   public String productList(Model model, int mNum) { 
	   ArrayList <ProductVO> productList = productService.getProductList(mNum);    
	   model.addAttribute("pList",productList); 
	   return "/product/list";  

   }
    
    

}
