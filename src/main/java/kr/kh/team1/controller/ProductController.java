package kr.kh.team1.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/product/list")
	public String productList(Model model) {
		ArrayList<ProductVO>list = productService.getProductList();
		
		model.addAttribute("title", "거래글 리스트");
		model.addAttribute("list", list);
		return "/product/list";
	}

}
