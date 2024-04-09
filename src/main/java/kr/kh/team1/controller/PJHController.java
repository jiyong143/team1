package kr.kh.team1.controller;

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

import kr.kh.team1.model.dto.LoginDTO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.service.MemberService;


@Controller
public class PJHController {
	
	@Autowired
	MemberService memberService;
	
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
	
//	@GetMapping("/logout")
//	public String logout(Model model, HttpSession session) {
//		session.removeAttribute("user");
//		model.addAttribute("msg", "로그아웃 했습니다.");
//		model.addAttribute("url", "/");
//		return "message";
//	}
	
}
