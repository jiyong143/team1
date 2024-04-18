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
import kr.kh.team1.model.vo.UpHeadVO;
import kr.kh.team1.pagination.Criteria_supot;
import kr.kh.team1.pagination.PageMaker_supot;
import kr.kh.team1.service.SurportService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class LKJController {
	
	@Autowired
	SurportService surportService;
	
	@GetMapping("/surport/list")
	public String surportList(Model model, Criteria_supot cris) {
		cris.setPerPageNum(5);
		ArrayList<SurportVO> list = surportService.getSurportList(cris);
		int totalCount = surportService.getSurportTotalCount(cris);
		PageMaker_supot pms = new PageMaker_supot(5, cris, totalCount);
		model.addAttribute("pm", pms);
		model.addAttribute("title", "고객지원");
		model.addAttribute("list", list);
		return("/surport/list");
	}
	
	@GetMapping("/surport/insert")
	public String surportInsert(Model model) {
		//고객지원타입 리스트를 화면에 전송 -> 1.공지사항 , 2.문의사항
		ArrayList<SurportManageVO> list = surportService.getSurportManageList();
		model.addAttribute("list", list);
		model.addAttribute("title", "고객문의 등록");
		return "/surport/insert";
	}
	/*
	@GetMapping("/surport/list")
	public String upHeadInsert(Model model) {
		//말머리 리스트를 화면에 전송 -> 1.공지 , 2.필독 , 3.문의
		ArrayList<UpHeadVO> list = surportService.getUpHeadList();
		model.addAttribute("list", list);
		return "/surport/list";
	}
	*/
	@PostMapping("/surport/insert")
	public String surportInsertPost(Model model, SurportVO surport, HttpSession session) {
		//작성자 아이디를 가지고 문의글 작성
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = surportService.insertSurport(surport, user);
		log.info(surport);
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
	public String surportDetail(Model model, Integer suNum, Criteria_supot cris) {
		if(suNum == null) {
			
		}else {
		surportService.updateView(suNum);
		SurportVO surport = surportService.getSurport(suNum);
		model.addAttribute("surport", surport);
		model.addAttribute("ctis", cris);
		}
		return "/surport/detail";
	}
	
	@GetMapping("/surport/update")
	public String surportUpdate(Model model, Integer suNum) {
		if(suNum == null) {
			
		}else {
		//이미 insert문에서 사용 -> 고객관리 카테고리에서 리스트를 가져와 화면에 전송
		ArrayList<SurportManageVO> list = surportService.getSurportManageList();
		//detail에서 사용
		SurportVO surport = surportService.getSurport(suNum);
		
		model.addAttribute("surport", surport);
		model.addAttribute("list", list);
		}
		return "/surport/update";
	}
	
	@PostMapping("/surport/update")
	public String surportUpdatePost(Model model, SurportVO surport, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = surportService.updateSurport(surport, user);
		if(res) {
			model.addAttribute("url", "/surport/detail?suNum="+surport.getSu_num());
			model.addAttribute("msg", "문의글을 수정했습니다.");
		}else {
			model.addAttribute("url", "/surport/detail?suNum="+surport.getSu_num());
			model.addAttribute("msg", "문의글 수정에 실패하였습니디.");
		}
		return "message";
	}
	
	@GetMapping("/surportManage/list")
	//고정 문의글 리스트 
	public String surportManageList(Model model) {
		return "/surportManage/list";
	}
	
	//고정문의 페이지 모음 -> 시작
	@GetMapping("/surportManage/QnA/QnApage1")
	public String userQnA(Model model) {
		return "/surportManage/QnA/QnApage1";
	}
	
	@GetMapping("/surportManage/QnA/QnApage2")
	public String userQnA2(Model model) {
		return "/surportManage/QnA/QnApage2";
	}
	

}
