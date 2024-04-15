package kr.kh.team1.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.SurportManageVO;
import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.pagination.Criteria;
import kr.kh.team1.pagination.PageMaker;
import kr.kh.team1.service.SurportService;

@Controller
public class LKJController {
	
	@Autowired
	SurportService surportService;
	
	@GetMapping("/surport/list")
	public String surportList(Model model, Criteria cri) {
		ArrayList<SurportVO> list = surportService.getSurportList(cri);
		int totalCount = surportService.getSurportTotalCount(cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		model.addAttribute("pm", pm);
		model.addAttribute("title", "고객지원");
		model.addAttribute("list", list);
		return("/surport/list");
	}
	
	@GetMapping("/surport/insert")
	public String surportInsert(Model model) {
		ArrayList<SurportManageVO> list = surportService.getSurportManageList();
		model.addAttribute("list", list);
		model.addAttribute("title", "QnA 등록");
		return "/surport/insert";
	}
	
	@PostMapping("/surport/insert")
	public String surportInsertPost(Model model, SurportVO surport, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = surportService.insertSurport(surport, user);
		if(res) {
			model.addAttribute("msg", "고객문의를 주셔서 감사합니다.");
			model.addAttribute("url", "/surport/list");
		}else {
			model.addAttribute("msg", "고객문의 작성이 실패하였습니다.");
			model.addAttribute("url", "/surport/insert");
		}
		return "message";
	}
	
	@GetMapping("/surport/detail")
	public String surportDetail(Model model) {
		//surportService.updateView(num);
		return "/surport/detail";
	}
	
	@GetMapping("/surportMm/list")
	public String surportMmList(Model model) {
		return "/surportMm/list";
	}
	
	@GetMapping("/surport/update")
	public String surportUpdate(Model model) {
		return "/surport/update";
	}

}
