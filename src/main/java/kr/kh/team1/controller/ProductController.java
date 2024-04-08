package kr.kh.team1.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;
import kr.kh.team1.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	
	ProductService productService;
	
	@GetMapping("/product/list")
	public String productList(Model model, Criteria cri) {
		ArrayList<ProductVO> list = productService.getProductList(cri);
		return "/product/list";
	}
	
}
