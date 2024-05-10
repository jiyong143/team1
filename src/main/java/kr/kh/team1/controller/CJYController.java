package kr.kh.team1.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import kr.kh.team1.model.vo.ZipcodeVO;
import kr.kh.team1.pagination.PageMaker;
import kr.kh.team1.pagination.ProductCriteria;
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
	
	
	
	@GetMapping("/product/update")
	public String productUpdate(Model model, int num ) {
		ArrayList<ZipcodeVO> sidoList = topGroupService.getSidoList();
		ArrayList <FileVO> files = productService.getFileBypNum(num);
		ProductVO pro = productService.getProductInfo(num);
		String address = pro.getPr_place();
		String[] components = address.split(" ");
		String sido = components[0];
        String gu = components[1];
        String dong = components[2];
        ArrayList <ZipcodeVO> guList = topGroupService.getSigunguList(sido);
        ArrayList <ZipcodeVO> dongList = topGroupService.getDongList(sido, gu);
		String price = null;
		if(pro.getPr_price()==-10) {
			price="가격제안";
		}else if(pro.getPr_price()==0) {
			price="무료나눔";
		}else {
			DecimalFormat formatter = new DecimalFormat("#,###");
			price = formatter.format(pro.getPr_price());
		}
		model.addAttribute("price",price);
		int topNum = productService.getTopNum(num);
		ArrayList <TopGroupVO> topGroupList = topGroupService.getTopGroupList(); 
		TopGroupVO topGroup = topGroupService.getTopGroup(topNum);
		model.addAttribute("midList",topGroup.getMidGroupList());
		model.addAttribute("pro", pro);
		model.addAttribute("files" , files);
		model.addAttribute("topList",topGroupList);
		model.addAttribute("count",pro.getPr_content().length());
		model.addAttribute("sidoList",sidoList);
		model.addAttribute("sido",sido);
		model.addAttribute("gu",gu);
		model.addAttribute("dong",dong);
		model.addAttribute("guList",guList);
		model.addAttribute("dongList",dongList);
		return "/product/update";  
	}
	
	
	@ResponseBody
	@GetMapping("/product/update1")
	public Map<String ,Object> productUpdate1(String topName, int pNum) {
		ProductVO pro = productService.getProductInfo(pNum);// pNum 상품이 포함된 mid의 이름
		TopGroupVO topGroup = topGroupService.getTopGroupByName(topName);
	   	HashMap<String, Object> map = new HashMap<String, Object>();
	   	map.put("mids",topGroup.getMidGroupList());
	   	map.put("mName",pro.getPr_mg_name());
	   	return map;  
	}
	
	
	@ResponseBody
	@GetMapping("/product/update2")
	public Map<String ,Object> productUpdate2(String topPlace, int pNum) {
		ProductVO pro = productService.getProductInfo(pNum);
		String address = pro.getPr_place();
		String[] components = address.split(" ");
		String gu = components[1]; 
		ArrayList <ZipcodeVO> guList = topGroupService.getSigunguList(topPlace);
	   	HashMap<String, Object> map = new HashMap<String, Object>();
	   	map.put("guList",guList);
	   	map.put("gu", gu);
	   	return map;  
	}
	
	@ResponseBody
	@GetMapping("/product/update3")
	public Map<String ,Object> productUpdate3(String midPlace, int pNum) {
		ProductVO pro = productService.getProductInfo(pNum);
		String address = pro.getPr_place(); 
		String[] components = address.split(" ");
		String sido = components[0];
		String dong = components[2]; 
		ArrayList <ZipcodeVO> dongList = topGroupService.getDongList(sido, midPlace); 
	   	HashMap<String, Object> map = new HashMap<String, Object>();
	   	map.put("dong", dong);
	   	map.put("dongList",dongList );
	   	return map;  
	}
	
	@ResponseBody
	@GetMapping("/product/update4")
	public Map<String ,Object> productUpdate4(String topPlace, String midPlace, int pNum) {
		ProductVO pro = productService.getProductInfo(pNum);
		String address = pro.getPr_place(); 
		String[] components = address.split(" ");
		String dong = components[2]; 
		ArrayList <ZipcodeVO> dongList = topGroupService.getDongList(topPlace, midPlace);  
	   	HashMap<String, Object> map = new HashMap<String, Object>();
	   	map.put("dong", dong);
	   	map.put("dongList",dongList );
	   	return map;  
	}
	
	@ResponseBody
	@GetMapping("/product/update5")
	public Map<String ,Object> productUpdate5(int pNum) {
		ArrayList <ChatRoomVO> chatRoomList = chatService.getChatRoomIds(pNum);
	   	HashMap<String, Object> map = new HashMap<String, Object>();
	   	map.put("chatRoomList", chatRoomList);
	   	return map;  
	}
	
	@ResponseBody
	@PostMapping("/product/update")
	public String productUpdatePost(@RequestParam("media") List<MultipartFile> media  ) { 
		System.out.println(media);
		for (MultipartFile image : media) {   
            System.out.println(image.getOriginalFilename()); 
        }
		return "message";    
	}
	
	
	
	


	@GetMapping("/product/list")  
   	public String productList(Model model, int mNum, ProductCriteria cri, String mName, String tName, HttpSession session) {
	   	String maxPrice = productService.getMaxPrice(mNum,cri);
	   	String minPrice = productService.getMinPrice(mNum,cri);
	   	String avgPrice = productService.getAvgPrice(mNum,cri); 
	   	model.addAttribute("maxPrice",maxPrice);
	   	model.addAttribute("minPrice",minPrice);
	   	model.addAttribute("avgPrice",avgPrice);
	   	ArrayList <ProductVO> productList = productService.getProductList(mNum, cri);
	   	int totalCount = productService.getProductTotalCount(mNum, cri);
	   	PageMaker pm = new PageMaker(3, cri, totalCount);
	   	model.addAttribute("search",cri.getSearch());
	   	model.addAttribute("place",cri.getPlace());
	   	model.addAttribute("minimum",cri.getMinPrice());
	   	model.addAttribute("maximum",cri.getMaxPrice());
	   	model.addAttribute("pm", pm);
	   	model.addAttribute("pList",productList); 
	   	model.addAttribute("num" , mNum); 
	   	session.setAttribute("MName",mName); 
	   	session.setAttribute("TName",tName);
	   	return "/product/list";   
	}
	
	
	@GetMapping("/product/list3")   
   	public String productList3(Model model, int mNum, ProductCriteria cri, String mName, String tName, HttpSession session) {
		String min = null;
		String max = null;
		if(cri.getMinPrice()==-100) {
			min="";
		}else if(cri.getMinPrice()==0) {
			min="0";
		}else {
			DecimalFormat formatter = new DecimalFormat("#,###");
			min = formatter.format(cri.getMinPrice());
		}
		
		if(cri.getMaxPrice()==1000000000) {
			max="";
		}else if(cri.getMaxPrice()==0) {
			max="0";
		}else {
			DecimalFormat formatter = new DecimalFormat("#,###");
			max = formatter.format(cri.getMaxPrice());
		}
	   	String maxPrice = productService.getMaxPrice(mNum,cri);
	   	String minPrice = productService.getMinPrice(mNum,cri);
	   	String avgPrice = productService.getAvgPrice(mNum,cri); 
	   	model.addAttribute("maxPrice",maxPrice);
	   	model.addAttribute("minPrice",minPrice);
	   	model.addAttribute("avgPrice",avgPrice);
	   	ArrayList <ProductVO> productList = productService.getProductList(mNum, cri);
	   	int totalCount = productService.getProductTotalCount(mNum, cri);
	   	PageMaker pm = new PageMaker(3, cri, totalCount);
	   	model.addAttribute("search",cri.getSearch());
	   	model.addAttribute("place",cri.getPlace());
	   	model.addAttribute("pm", pm);
	   	model.addAttribute("pList",productList); 
	   	model.addAttribute("num" , mNum);
	   	model.addAttribute("min",min);
	   	model.addAttribute("max",max);
	   	model.addAttribute("minimum",cri.getMinPrice());
	   	model.addAttribute("maximum",cri.getMaxPrice());
	   	session.setAttribute("MName",mName); 
	   	session.setAttribute("TName",tName);
	   	return "/product/list";   
	}
   
	@ResponseBody
	@GetMapping("/product/list2")  
   	public Map<String ,Object> productList2(int mNum, ProductCriteria cri, String tName, String mName) {
		String maxPrice = productService.getMaxPrice(mNum,cri);
	   	String minPrice = productService.getMinPrice(mNum,cri);
	   	String avgPrice = productService.getAvgPrice(mNum,cri); 
	   	ArrayList <ProductVO> productList = productService.getProductList(mNum, cri);
	   	int totalCount = productService.getProductTotalCount(mNum, cri); 
	   	PageMaker pm = new PageMaker(3, cri, totalCount);  
	   	HashMap<String, Object> map = new HashMap<String, Object>();
	   	map.put("place", cri.getPlace() );
	   	map.put("search", cri.getSearch());
	   	map.put("order", cri.getOrder() );
	   	map.put("apple", cri.getApple());
	   	map.put("banana", cri.getBanana());
	   	map.put("min", cri.getMinPrice());
		map.put("max", cri.getMaxPrice());
	   	map.put("TName",tName);
	   	map.put("MName", mName ); 
	   	map.put("num", mNum);
	   	map.put("pm", pm);
	   	map.put("pList", productList); 
	   	map.put("maxPrice", maxPrice);
	   	map.put("minPrice", minPrice);
	   	map.put("avgPrice", avgPrice);
	   	return map;  
	}
	

	@PostMapping("/product/up")
	public String productUp(Model model, HttpSession session, int num) {
		// 회원 정보 가져옴
		MemberVO user = (MemberVO)session.getAttribute("user");
		// 위로 올리는 삼품 가져오기
		ProductVO pro = productService.getProductInfo(num);
		int mNum = pro.getPr_mg_num();
		String mName = pro.getPr_mg_name();
		String tName = pro.getPr_tg_name();
		if(productService.upProduct(user,pro)) {
			model.addAttribute("msg", "상품을 위로 올렸습니다.");
			model.addAttribute("url", "/product/list?mNum=" + mNum  + "&mName=" + mName + "&tName=" + tName);
		}else {
			model.addAttribute("msg", "상품을 위로 올리지 못했습니다.");
			model.addAttribute("url", "/product/detail?pNum=" + num);
		}
		return "message"; 
	}
	

	@GetMapping("/product/insert")
	public String productTopGroupList(Model model, HttpSession session) {
   	
		ArrayList<TopGroupVO> topGroupList = topGroupService.getTopGroupList();
		ArrayList<ZipcodeVO> sidoList = topGroupService.getSidoList();
	   	model.addAttribute("topGroupList", topGroupList);
	   	model.addAttribute("sidoList", sidoList);
	   	return "/product/insert";
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
		   ProductVO product, MultipartFile[] file, String mg_title, String tg_title, int optradio, ZipcodeVO zip) { 
	   
	    // 회원 정보 가져옴
		MemberVO user = (MemberVO)session.getAttribute("user");

		if(optradio == 0 || optradio == -10)
			product.setPr_price(optradio);
	
		// mNum = 중분류번호, mName = 중분류 이름, tName = 대분류 이름
		MidGroupVO mGroup = productService.getMidGroup(mg_title);
		int mNum = mGroup.getMg_num();
		String mName = mg_title;
		String tName = tg_title;
		String place = zip.getSido() + " " + zip.getSigungu() + " " + zip.getH_dong_nm();
		product.setPr_place(place);

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
	public String productDetail(HttpSession session, Model model, int pNum) {
		
		productService.upView(pNum);
	   	ArrayList<FileVO> files = productService.getFileBypNum(pNum);
   
	   	// 제품 번호를 주고 대,중분류 + 제목 + 가격 + 희망 지역 가져옴
	   	ProductVO productInfo = productService.getProductInfo(pNum);
		
	   	int tradeNum = -1;
	   	int reviewNum = -1;
	    tradeNum = memberService.getTradeNum(productInfo.getPr_me_id());	// 거래 수
	    reviewNum = memberService.getReviewNum(productInfo.getPr_me_id());	// 후기 수
	    MemberVO prUser = productService.getMemberInfoByUser(productInfo.getPr_me_id());	// 상품 회원
	    
	    MemberVO loginUser = (MemberVO)session.getAttribute("user");
	    if(loginUser != null) {
		    // 상품 번호 + 유저로 찜했는지 
		    PickVO pick = productService.getPickByUserAndNum(loginUser.getMe_id(), pNum);
		    if(pick == null) 
		    	pick = new PickVO();
		    model.addAttribute("pick", pick);
		    model.addAttribute("loginUser", loginUser);
	    }
	    
	    model.addAttribute("prUser", prUser);
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
   		MemberVO loginUser = (MemberVO)session.getAttribute("user");
   		if(loginUser == null) {
   			map.put("msg", "비회원은 채팅할 수 없습니다.");
   			return map;
   		}
   		
   		ProductVO productInfo = productService.getProductInfo(pr_num);
   		MemberVO prUser = productService.getMemberInfoByUser(productInfo.getPr_me_id());	// 상품 회원
   		if(prUser.getMe_id().equals(loginUser.getMe_id())) {
   			map.put("msg", "본인 상품에 채팅할 수 없습니다.");
   			return map;
   		}
   		
   		ChatRoomVO crv = chatService.getChatRoom(loginUser.getMe_id(), pr_num);

   		// 채팅방이 없으면 생성
   		if(crv == null) {
   			chatService.insertChatRoom(loginUser.getMe_id(), pr_num);	// 채팅방 생성
   			crv = chatService.getChatRoom(loginUser.getMe_id(), pr_num);
   			chatService.insertChatRoomState(loginUser.getMe_id(), crv.getCr_num()); // 생성된 채팅방과 로그인한 회원의 채팅 상태 추가
   			chatService.insertChatRoomState(prUser.getMe_id(), crv.getCr_num()); // 생성된 채팅방과 판매자의 채팅 상태 추가 
   		}
   		
   		int cr_num = crv.getCr_num();	// 채팅방 번호
   		map.put("cr_num", cr_num);
   		
   		return map; 
   	}
   	
   	@ResponseBody
  	@PostMapping(value = "/product/pick")  
	public Map<String, Object> productPick(HttpSession session, int pr_num) {
      	
   		HashMap<String, Object> map = new HashMap<String, Object>();
   		
   		MemberVO loginUser = (MemberVO)session.getAttribute("user");
   		if(loginUser == null) {
   			map.put("msg", "비회원은 찜할 수 없습니다.");
   			return map;
   		}

   		// 게시글 정보 가져와서 로그인한 회원과 일치 여부
   		ProductVO pro = productService.getProductInfo(pr_num);
   		
   		String msg = "";
   		msg = productService.getMsg(pro.getPr_me_id(), loginUser.getMe_id()); // 찜 가능 여부(본인인지 아닌지)
   		
   		if(msg == null) { // msg가 x => 본인이 아니다
   			PickVO isPick = productService.getPickByUserAndNum(loginUser.getMe_id(), pr_num);
   			String res = productService.booleanPick(loginUser.getMe_id(),pr_num, isPick);
   			map.put("res", res);
   		}
   		
	    map.put("msg", msg);
   		return map; 
   	}
   	
   	@ResponseBody
  	@PostMapping(value = "/product/pickAndView")  
	public Map<String, Object> productPickAndView(int pr_num) {
      	
   		HashMap<String, Object> map = new HashMap<String, Object>();
   		
   		ProductVO productInfo = productService.getProductInfo(pr_num);
   		map.put("pickInfo", productInfo);
   		return map; 
   	}
}