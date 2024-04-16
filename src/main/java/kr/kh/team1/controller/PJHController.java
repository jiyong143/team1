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
	public String mypage(Model model, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		int tradeNum = -1;
		tradeNum = memberService.getTradeNum(user.getMe_id());
		
		int reviewNum = -1;
		reviewNum = memberService.getReviewNum(user.getMe_id());
		
		model.addAttribute("user", user);
		model.addAttribute("tradeNum", tradeNum);
		model.addAttribute("reviewNum",reviewNum);
		model.addAttribute("listSize", 0);
		
		return "/member/mypage";
	}
	
	@ResponseBody
	@GetMapping("/member/mypage/all")
	public Map<String, Object> mypageProduct(Model model, HttpServletRequest request, @RequestParam("clickData")String clickData, @RequestParam("type")String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		ArrayList<ProductVO> list;
		list = productService.getMypagePro(user.getMe_id(), clickData);
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
	
}
