package kr.kh.team1.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.mysql.cj.x.protobuf.MysqlxCrud.Insert;

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
		cris.setPerPageNum(10);
		ArrayList<SurportVO> surportList = surportService.getSurportList(cris);
		int totalCount = surportService.getSurportTotalCount(cris);
		PageMaker_supot pms = new PageMaker_supot(5, cris, totalCount);
		model.addAttribute("pms", pms);
		model.addAttribute("title", "고객지원");
		model.addAttribute("list", surportList);
		log.info(surportList);
		return("/surport/list");
	}
	
	@GetMapping("/surport/insert")
	public String surportInsert(Model model) {
		//고객지원타입 리스트를 화면에 전송 -> 1.공지사항 , 2.문의사항
		//글머리 리스트를 화면에 전송 -> 1.필독 , 2.공지 , 3.문의
		ArrayList<SurportManageVO> surportManageList = surportService.getSurportManageList();
		ArrayList<UpHeadVO> upHeadList = surportService.getUpHeadList();
		model.addAttribute("surportManageList", surportManageList);//지원타입 
		model.addAttribute("upHeadList", upHeadList);//글머리 
		model.addAttribute("title", "고객문의 등록");
		return "/surport/insert";
	}
	
	@PostMapping("/surport/insert")
	public String surportInsertPost(Model model, SurportVO surport, HttpSession session) {
		//작성자 아이디를 가지고 문의글 작성
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = surportService.insertSurport(surport, user);
		if(res) {
			model.addAttribute("msg", "고객문의를 주셔서 감사합니다.");
			model.addAttribute("url", "/surport/list");
		}else {
			model.addAttribute("msg", "고객문의 작성이 실패하였습니다.");
			model.addAttribute("url", "/surport/insert");
		}
		log.info(surport);
		return "message";
	}
	
	@GetMapping("/surport/detail")
	public String surportDetail(Model model, int suNum) {
		//게시글 번호에 따른 조회수 증가
		surportService.updateView(suNum);
		SurportVO surport = surportService.getSurport(suNum);
		model.addAttribute("surport", surport);
		model.addAttribute("title", "고객문의 상세");
		log.info(surport);
		return "/surport/detail";
	}
	
	@GetMapping("/surport/update")
	public String surportUpdate(Model model, Integer suNum) {
		if(suNum == null) {
			
		}else {
		//이미 insert문에서 사용 -> 고객관리 카테고리에서 리스트를 가져와 화면에 전송
		ArrayList<SurportManageVO> surportManageList = surportService.getSurportManageList();
		
		ArrayList<UpHeadVO> upHeadList = surportService.getUpHeadList();
		//detail에서 사용
		SurportVO surport = surportService.getSurport(suNum);
		
		model.addAttribute("surport", surport);
		model.addAttribute("surportManageList", surportManageList);
		model.addAttribute("upHeadList", upHeadList);
		}
		model.addAttribute("title", "문의글 수정");
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
		log.info(surport);
		return "message";
	}
	
	
	
	@GetMapping("/surportManage/list")
	//고정 문의글 리스트 
	public String surportManageList(Model model) {
		return "/surportManage/list";
	}
	
	@GetMapping("/surportManage/adminList")
	//관리자 고정문의 타입 관리
	public String surportAdminLis(Model model) {
		return "/surportManage/adminList";
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
	
	@GetMapping("/admin/adminPage")
	//관리자 페이지
	public String adminPage(Model model) {
		return "/admin/adminPage";
	}
}
