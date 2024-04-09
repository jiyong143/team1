package kr.kh.team1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CJYController {

   @GetMapping("/product/list")
   public String productList(Model model, int mNum) {
	   
	   
	   return "";
   }
    
    
    

}
