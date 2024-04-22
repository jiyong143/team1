package kr.kh.team1.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.kh.team1.model.dto.LoginDTO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.service.MemberService;
import kr.kh.team1.service.ProductService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class PJHController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ProductService productService;
	
	@GetMapping("/main/home")
	public String home(Model model) {
		MemberVO dateTest = memberService.getMemberDate();
		System.out.println("test" + dateTest.getMe_birth());
		model.addAttribute("test1", dateTest);
		return "/main/home";
	}
	
	@GetMapping("/member/signup")
	public String signup(Model model) {
		model.addAttribute("title", "회원가입");
		return "/member/signup";
	}
	@PostMapping("/member/signup")
	public String signupPost(Model model, MemberVO member) {
		boolean res = memberService.signup(member);
		if(res) {
			model.addAttribute("msg", "회원가입을 성공했습니다.");
			model.addAttribute("url", "/");
		}else {
			model.addAttribute("msg", "회원가입을 실패했습니다.");
			model.addAttribute("url", "/member/signup");
		}
			
		return "message";
	}
	
	@GetMapping("/member/login")
	public String login(Model model) {
		model.addAttribute("title", "로그인");
		return "/member/login";
	}
	
	@PostMapping("/member/login")
	public String loginPost(Model model, LoginDTO loginDto, HttpSession session) {
		MemberVO user = memberService.login(loginDto);
		model.addAttribute("user", user);//user라는 이름으로 전송
		session.setAttribute("user", user);
		if(user != null) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "로그인을 했습니다.");
		}else {
			model.addAttribute("url", "/member/login");
			model.addAttribute("msg", "로그인을 하지 못했습니다.");
		}
		return "message";
	}
	
	@ResponseBody
	@GetMapping("/id/check/dup")
	public Map<String, Object> idCheckDup(@RequestParam("id") String id){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.idCheck(id);
		map.put("result", res);
		return map;
	}
	
	@ResponseBody
	@GetMapping("/email/check/dup")
	public Map<String, Object> emailCheckDup(@RequestParam("email") String email){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.emailCheck(email);
		map.put("result", res);
		return map;
	}
	
	@ResponseBody
	@GetMapping("/phone/check/dup")
	public Map<String, Object> phoneCheckDup(@RequestParam("phone") String phone){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.phoneCheck(phone);
		map.put("result", res);
		return map;
	}
	
	@ResponseBody
	@GetMapping("/birth/check/dup")
	public Map<String, Object> birthCheckDup(@RequestParam("birth") String birth){
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.birthCheck(birth);
		map.put("result", res);
		return map;
	}
	
	@GetMapping("/member/logout")
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("user");
		model.addAttribute("msg", "로그아웃 했습니다.");
		model.addAttribute("url", "/");
		return "message";
	}
	
	@GetMapping("/member/mypage")
	public String mypage(Model model, HttpServletRequest request, String me_id) {
		
		MemberVO myUser;
		if(me_id==null) {
			myUser = (MemberVO)request.getSession().getAttribute("user");
			model.addAttribute("myUserCheck", myUser.getMe_id());
			
		} else {
			myUser = memberService.getMember(me_id);
			model.addAttribute("myUserCheck", me_id);
		}
		
		int tradeNum = -1;
		tradeNum = memberService.getTradeNum(myUser.getMe_id());
		
		int reviewNum = -1;
		reviewNum = memberService.getReviewNum(myUser.getMe_id());
		
		model.addAttribute("myUser", myUser);
		model.addAttribute("tradeNum", tradeNum);
		model.addAttribute("reviewNum",reviewNum);
		model.addAttribute("listSize", 0);
		
		return "/member/mypage";
	}
	
	@ResponseBody
	@GetMapping("/member/mypage/all")
	public Map<String, Object> mypageProduct(Model model, HttpServletRequest request, @RequestParam("clickData")String clickData, @RequestParam("type")String type, @RequestParam("userId")String userId) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO sessionMember = (MemberVO)request.getSession().getAttribute("user");
		MemberVO myUser;
		
		if(userId==null) { //자신의 마이페이지를 확인하는 경우
			myUser = sessionMember; //세션에 저장되어 있는(로그인 한 아이디) 아이디를 불러와서 출력
			model.addAttribute("myUserCheck", myUser.getMe_id());
		} else { // 다른 회원의 마이페이지를 확인하는 경우
			myUser = memberService.getMember(userId);
			model.addAttribute("myUserCheck", userId);
		}
		
		ArrayList<ProductVO> list;
		list = productService.getMypagePro(myUser.getMe_id(), clickData, type);
		
		if(list.size() == 0 ) {
			model.addAttribute("listSize", list.size());
			map.put("list", list);
			
			return map;
		}
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd"); 
		for(int i=0; i<list.size(); i++) {
			String tmpDate = simpleDateFormat.format(list.get(i).getPr_date());
			list.get(i).setPr_date2(tmpDate);
		}
		list.get(0).setListSize(list.size());
		
		model.addAttribute("listSize", list.size());
		
		map.put("list", list);
		
		return map;
	}

	@ResponseBody
	@PostMapping("/member/payment")
	public String payment(Model model, @RequestParam("orderUid")String orderUid, @RequestParam("paymentPrice")int paymentPrice, @RequestParam("userId")String userId) {
		
		System.out.println(orderUid + "   " + paymentPrice + "   " + userId);
		
		memberService.addPoint(orderUid, paymentPrice, userId);
		
		return "";
	}
	
	
}
