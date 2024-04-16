package kr.kh.team1.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.pagination.Criteria;
import kr.kh.team1.pagination.PageMaker;
import kr.kh.team1.service.ProductService;
import kr.kh.team1.service.TopGroupService;

@Controller
public class CJYController {
	
	@Autowired
	ProductService productService; 

	@Autowired
	TopGroupService topGroupService;

	@GetMapping("/product/list")  
	public String productList(Model model, int mNum, Criteria cri, String mName, String tName, HttpSession session) {
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
   
   @GetMapping("/product/insert")
   public String productList(Model model, HttpSession session) {
   	
	   ArrayList<TopGroupVO> topGroupList = topGroupService.getTopGroupList();
	   model.addAttribute("topGroupList", topGroupList);


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
   
   @ResponseBody
   @GetMapping("/product/midGroup")
   public Map<String, Object> idCheckDup(@RequestParam("tg_title") String tg_title){
		Map<String, Object> map = new HashMap<String, Object>();
		
		System.out.println(tg_title);
		ArrayList<MidGroupVO> midList = topGroupService.getMidGroupListByTopGroup(tg_title);
		
		map.put("data", midList);
		return map;
	}

   @PostMapping("/product/insert")  
   public String productListPost(Model model, HttpSession session, 
		   ProductVO product, MultipartFile[] file, String mg_title, String tg_title, int optradio) {
	   
	    // 회원 정보 가져옴
		MemberVO user = (MemberVO)session.getAttribute("user");
		System.out.println(optradio);
		if(optradio == 0 || optradio == -10)
			product.setPr_price(optradio);
			
		// mNum = 중분류번호, mName = 중분류 이름, tName = 대분류 이름
		MidGroupVO mGroup = productService.getMidGroup(mg_title);
		int mNum = mGroup.getMg_num();
		String mName = mg_title;
		String tName = tg_title;
		if(productService.insertProduct(product, user, file, mg_title)) {
			model.addAttribute("msg", "게시글을 등록했습니다.");
			model.addAttribute("url", "/product/list?mNum=" + mNum + "&mName=" + mName + "&tName=" + tName);
		}else {
			model.addAttribute("msg", "게시글을 등록하지 못했습니다.");
			model.addAttribute("url", "/product/insert");
		}
		return "message";
   }
}