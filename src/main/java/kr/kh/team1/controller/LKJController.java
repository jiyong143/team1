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
import org.springframework.web.bind.annotation.RequestBody;

import kr.kh.team1.model.vo.CommentVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.SurportManageVO;
import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.model.vo.UpHeadVO;
import kr.kh.team1.pagination.Criteria_supot;
import kr.kh.team1.pagination.PageMaker_supot;
import kr.kh.team1.service.CommentService;
import kr.kh.team1.service.SurportService;
import lombok.extern.log4j.Log4j;

@Controller
public class LKJController {

	@Autowired
	SurportService surportService;

	@Autowired
	CommentService commentService;

	@GetMapping("/surport/list")
	public String surportList(Model model, Criteria_supot cris) {
		cris.setPerPageNum(10);
		ArrayList<SurportVO> surportList = surportService.getSurportList(cris);
		int totalCount = surportService.getSurportTotalCount(cris);
		PageMaker_supot pms = new PageMaker_supot(5, cris, totalCount);
		model.addAttribute("pms", pms);
		model.addAttribute("title", "고객지원");
		model.addAttribute("list", surportList);
		// model.addAttribute("list", list);
		return ("/surport/list");
	}

	@GetMapping("/surport/insert")
	public String surportInsert(Model model) {
		// 고객지원타입 리스트를 화면에 전송 -> 1.공지사항 , 2.문의사항
		// 글머리 리스트를 화면에 전송 -> 1.필독 , 2.공지 , 3.문의
		ArrayList<SurportManageVO> surportManageList = surportService.getSurportManageList();
		ArrayList<UpHeadVO> upHeadList = surportService.getUpHeadList();
		model.addAttribute("surportManageList", surportManageList);// 지원타입
		model.addAttribute("upHeadList", upHeadList);// 글머리
		model.addAttribute("title", "고객문의 등록");
		return "/surport/insert";
	}

	@PostMapping("/surport/insert")
	public String surportInsertPost(Model model, SurportVO surport, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = surportService.insertSurport(surport, user);
		if (res) {
			model.addAttribute("msg", "고객문의를 주셔서 감사합니다.");
			model.addAttribute("url", "/surport/list");
		} else {
			model.addAttribute("msg", "고객문의 작성이 실패하였습니다.");
			model.addAttribute("url", "/surport/insert");
		}
		return "message";
	}

	@GetMapping("/surport/detail")
	public String surportDetail(Model model, int suNum) {
		surportService.updateView(suNum);
		SurportVO surport = surportService.getSurport(suNum);
		model.addAttribute("surport", surport);
		model.addAttribute("title", "고객문의 상세");
		return "/surport/detail";
	}

	@GetMapping("/surport/update")
	public String surportUpdate(Model model, Integer suNum) {
		if (suNum == null) {

		} else {
			// 이미 insert문에서 사용 -> 고객관리 카테고리에서 리스트를 가져와 화면에 전송
			ArrayList<SurportManageVO> surportManageList = surportService.getSurportManageList();

			ArrayList<UpHeadVO> upHeadList = surportService.getUpHeadList();
			// detail에서 사용
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
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = surportService.updateSurport(surport, user);
		if (res) {
			model.addAttribute("url", "/surport/detail?suNum=" + surport.getSu_num());
			model.addAttribute("msg", "문의글을 수정했습니다.");
		} else {
			model.addAttribute("url", "/surport/detail?suNum=" + surport.getSu_num());
			model.addAttribute("msg", "문의글 수정에 실패하였습니디.");
		}
		return "message";
	}

	@GetMapping("/surport/delete")
	public String surportDelete(Model model, int suNum, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = surportService.deleteSurport(suNum, user);
		if (res) {
			model.addAttribute("url", "/surport/list");
			model.addAttribute("msg", "글 삭제완료");
		} else {
			model.addAttribute("url", "/surport/detail?suNum=" + suNum);
			model.addAttribute("msg", "글 삭제 실패");
		}
		return "message";
	}

	@PostMapping("/comment/list")
	public Map<String, Object> commentList(@RequestBody Criteria_supot cris) {
		/*
		 * @RequestBody : 비동기 통신을 하기 위해 데이터를 담아 서버에서 클라이언트로 응답을 보낼 때 본문에 데이터를 담아서 보내야
		 * 하는데 요청본문 requestBody, 응답본문 responseBody 을 담아서 보내야 한다. 
		 */
		Map<String, Object> map = new HashMap<String, Object>();
		cris.setPerPageNum(5);
		
		ArrayList<CommentVO> commentList = commentService.getCommentList(cris);
		int totalCount = commentService.getTotalCount(cris);
		// 페이지 정보 생성
		PageMaker_supot pms = new PageMaker_supot(5, cris, totalCount);
		// 응답으로 전송할 데이터를 Map에 추가
		map.put("list", commentList);// 댓글목록
		map.put("pms", pms);// 페이지 정보
		return map;
	}

	@PostMapping("/comment/insert")
	public Map<String, Object> commentInsert(@RequestBody CommentVO comment, HttpSession session) {
		// 응답으로 전송할 데이터를 담을 Map 객체를 생성
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = commentService.insertComment(comment, user);
		System.out.println(res);
		map.put("result", res);
		return map;
	}

	@GetMapping("/surportManage/list")
	// 고정 문의글 리스트
	public String surportManageList(Model model) {
		return "/surportManage/list";
	}

	@GetMapping("/surportManage/adminList")
	// 관리자 고정문의 타입 관리
	public String surportAdminLis(Model model) {
		return "/surportManage/adminList";
	}

	// 고정문의 페이지 모음 -> 시작
	@GetMapping("/surportManage/QnA/QnApage1")
	public String userQnA(Model model) {
		return "/surportManage/QnA/QnApage1";
	}

	@GetMapping("/surportManage/QnA/QnApage2")
	public String userQnA2(Model model) {
		return "/surportManage/QnA/QnApage2";
	}

	@GetMapping("/admin/adminPage")
	// 관리자 페이지
	public String adminPage(Model model) {
		return "/admin/adminPage";
	}
}
