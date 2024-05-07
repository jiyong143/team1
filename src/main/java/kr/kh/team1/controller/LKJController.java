package kr.kh.team1.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team1.model.dto.MemberDTO;
import kr.kh.team1.model.vo.CommentVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReportVO;
import kr.kh.team1.model.vo.SurportManageVO;
import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.model.vo.UpHeadVO;
import kr.kh.team1.pagination.Criteria_member;
import kr.kh.team1.pagination.Criteria_report;
import kr.kh.team1.pagination.Criteria_supot;
import kr.kh.team1.pagination.PageMaker_member;
import kr.kh.team1.pagination.PageMaker_report;
import kr.kh.team1.pagination.PageMaker_supot;
import kr.kh.team1.service.CommentService;
import kr.kh.team1.service.MemberService;
import kr.kh.team1.service.ProductService;
import kr.kh.team1.service.ReportService;
import kr.kh.team1.service.SurportService;

@Controller
public class LKJController {

	@Autowired
	SurportService surportService;

	@Autowired
	CommentService commentService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	ProductService productService;

	@GetMapping("/surport/list")
	public String surportList(Model model, Criteria_supot cris) {
		cris.setPerPageNum(10);
		ArrayList<SurportVO> surportList = surportService.getSurportList(cris);
		int totalCount = surportService.getSurportTotalCount(cris);
		PageMaker_supot pms = new PageMaker_supot(5, cris, totalCount);
		model.addAttribute("pms", pms);
		model.addAttribute("title", "고객지원");
		model.addAttribute("list", surportList);
		return("/surport/list");
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
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = surportService.deleteSurport(suNum, user);
		if(res) {
			model.addAttribute("url", "/surport/list");
			model.addAttribute("msg", "글 삭제완료");
		}else {
			model.addAttribute("url", "/surport/detail?suNum="+suNum);
			model.addAttribute("msg", "글 삭제 실패");
		}
		return "message";
	}

	@ResponseBody
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
	
	@ResponseBody
	@PostMapping("/comment/delete")
	public Map<String, Object> commentDelete(@RequestBody CommentVO comment, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = commentService.commentDelete(comment, user);
		System.out.println(res);
		map.put("result", res);
		return map;
	}

	@ResponseBody
	@PostMapping("/comment/update")
	public Map<String, Object> commentUpdate(@RequestBody CommentVO comment, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = commentService.updateComment(comment, user);
		System.out.println(res);
		map.put("result", res);
		return map;
	}

	@GetMapping("/admin/memberManagement")
	public String memberManagement(Model model) {
		return "/admin/memberManagement";
	}	
	//회원관리 START -> 회원정보 불러오기
	@GetMapping("/admin/memberManager")
	public String memberManager(Model model, Criteria_member crim) {
		ArrayList<MemberVO> memberList = memberService.getMemberList(crim);
		int totalCount = memberService.getTotalCountMember(crim);
		PageMaker_member pmm = new PageMaker_member(5, crim, totalCount);
		crim.setPerPageNum(10);
		//페이지 당 정보 수
		model.addAttribute("pmm", pmm);
		model.addAttribute("title", "회원관리 페이지");
		model.addAttribute("list", memberList);
	    return "/admin/memberManager";
	}
	
	@ResponseBody
	@PostMapping("/admin/memberManager")
	public Map<String, Object> memberAuthority(Model model, MemberDTO memberInfo, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		
	    // 회원의 권한을 변경하는 비즈니스 로직 수행
	    boolean res = memberService.updateAuthority(memberInfo.getMe_id(), memberInfo.getMe_authority(), memberInfo.getMe_state());
	    return map;
	}
	//회원관리 END
	//신고 START
	@GetMapping("/report/list")
	public String reportList(Model model, Criteria_report crir) {
		crir.setPerPageNum(10);
		ArrayList<ReportVO> reportList = reportService.getReportList(crir);
		int totalCount = reportService.getReportTotalCount(crir);
		PageMaker_report pmr = new PageMaker_report(5, crir, totalCount);
		model.addAttribute(pmr);
		model.addAttribute("title", "신고 게시판");
		model.addAttribute("list", reportList);
		return "/report/list";
	}
	
	@GetMapping("/report/insert")
	public String reportProductInsert(Model model) {
		ArrayList<ProductVO> list = reportService.getProductList();
		model.addAttribute("list", list);

	public String reportInsert(Model model, ReportVO report, ProductVO product, String me_id, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		//boolean res = reportService.insertReport(report, product, user);
		model.addAttribute("title", "신고들 작성");
		model.addAttribute("me_id", me_id);

		return "/report/insert";
	}
	
	@PostMapping("/report/insert")
	public String reportProductInsertPost(Model model, ReportVO report, ProductVO product, HttpServletRequest request) {
		MemberVO user = (MemberVO)request.getAttribute("user");
		if(reportService.insertReportProduct(report, product, user)) {
			model.addAttribute("msg", "신고글 작성을 완료하였습니다.");
			model.addAttribute("url", "/report/list");
		}else {
			model.addAttribute("msg", "신고글 작성에 실패아였습니다.");
			model.addAttribute("url", "/report/inser");
		}
		System.out.println(report);
		return "message";

	}

	public String reportInsertPost(Model model, ReportVO report, HttpSession session) {

		System.out.println(report);
		boolean res = reportService.insertReportByIBH(report);
		if(res) {
			model.addAttribute("msg", "신고 성공!");
			model.addAttribute("url", "/report/list");
		}else {
			model.addAttribute("msg", "신고 실패!");
			model.addAttribute("url", "/report/insert?me_id="+report.getRe_me_id());
		}
		return "message";
	}
	
	//신고 END
	@GetMapping("/admin/inquityManager")
	public String InquityManager(Model model) {
		return "/admin/inquityManager";
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
	@GetMapping("/admin/managerPage")
	public String managePage(Model model) {
		return "/admin/managerPage";
	}
}
