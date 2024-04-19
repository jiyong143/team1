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

import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.FileVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.PickVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.pagination.Criteria;
import kr.kh.team1.pagination.PageMaker;
import kr.kh.team1.service.ChatService;
import kr.kh.team1.service.MemberService;
import kr.kh.team1.service.ProductService;
import kr.kh.team1.service.TopGroupService;

@Controller
public class CJYController {
	
	@Autowired
	ProductService productService; 

	@Autowired
	TopGroupService topGroupService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ChatService chatService;

	@GetMapping("/product/insert")
	public String productTopGroupList(Model model, HttpSession session) {
   	
		ArrayList<TopGroupVO> topGroupList = topGroupService.getTopGroupList();
	   	model.addAttribute("topGroupList", topGroupList);
	   	return "/product/insert";
	}


	@GetMapping("/product/list")  
   	public String productList(Model model, int mNum, Criteria cri, String mName, String tName, HttpSession session) {
	   	int maxPrice = productService.getMaxPrice(mNum,cri);
	   	int minPrice = productService.getMinPrice(mNum,cri);
	   	int avgPrice = productService.getAvgPrice(mNum,cri);
	   	System.out.println("***********************************"+maxPrice);
	   	System.out.println("***********************************"+minPrice);
//	   	if(minPrice<=0 || minPrice==null) {
//	   		
//	   	}
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
   
	@GetMapping("/product/detail")
	public String productDetail(Model model, HttpSession session, int pNum) {

		MemberVO member = (MemberVO)session.getAttribute("user");
		
		productService.upView(pNum);

	   	ArrayList<FileVO> files = productService.getFileBypNum(pNum);
   
	   	// 제품 번호를 주고 대,중분류 + 제목 + 가격 + 희망 지역 가져옴
	   	ProductVO productInfo = productService.getProductInfo(pNum);
		
	   	int tradeNum = -1;
	   	int reviewNum = -1;
	    tradeNum = memberService.getTradeNum(productInfo.getPr_me_id());
	    reviewNum = memberService.getReviewNum(productInfo.getPr_me_id());
	    MemberVO prUser = productService.getMemberByPnum(productInfo.getPr_me_id());
	
	    // 상품 번호 + 유저로 찜했는지 
	    PickVO pick = productService.getPickByUserAndNum(prUser.getMe_id(), pNum);
	    
	    model.addAttribute("prUser", prUser);
	    model.addAttribute("pick", pick);
	    model.addAttribute("tradeNum", tradeNum);
	    model.addAttribute("reviewNum",reviewNum);
	    model.addAttribute("pNum", pNum);
	    model.addAttribute("files", files);
	    model.addAttribute("info", productInfo);
	    return "/product/detail";
	}
   
   	@ResponseBody
   	@PostMapping(value = "/product/chat")  
	public Map<String, Object> productDetail(HttpSession session, int pr_num) {
      	
   		HashMap<String, Object> map = new HashMap<String, Object>();
   		MemberVO user = (MemberVO)session.getAttribute("user");
   		
   		// 채팅방이 없으면 생성
   		if(chatService.getChatRoom(user.getMe_id(),pr_num) == null) {
   			chatService.insertChatRoom(user.getMe_id(),pr_num);
   			ChatRoomVO crv = chatService.getChatRoom(user.getMe_id(),pr_num);
   			chatService.insertChatRoomState(user.getMe_id(), crv.getCr_num());
   		}
   		return map; 
   	}
   	
   	@ResponseBody
  	@PostMapping(value = "/product/pick")  
	public Map<String, Object> productPick(HttpSession session, int pr_num) {
      	
   		HashMap<String, Object> map = new HashMap<String, Object>();
   		
   		MemberVO user = (MemberVO)session.getAttribute("user");
   		// 게시글 정보 가져와서 로그인한 회원과 일치 여부
   		ProductVO pro = productService.getProductInfo(pr_num);
   		String msg = productService.getMsg(pro.getPr_me_id(), user.getMe_id()); // 찜 가능 여부(본인인지 아닌지)
   		
   		PickVO isPick = productService.getPickByUserAndNum(user.getMe_id(), pr_num);
   		String res = productService.booleanPick(user.getMe_id(),pr_num, isPick);

   		map.put("msg", msg);
   		map.put("res", res);
   		return map; 
   	}
}