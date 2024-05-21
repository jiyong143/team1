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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team1.model.dto.MemberDTO;
import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.ChatStateVO;
import kr.kh.team1.model.vo.CommentVO;
import kr.kh.team1.model.vo.FixedVO;
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
import kr.kh.team1.service.ChatService;
import kr.kh.team1.service.CommentService;
import kr.kh.team1.service.FixedService;
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
	
	@Autowired
	FixedService fixedService;
	
	@Autowired
	ChatService chatService;
	
	@GetMapping("/admin/adminPage")
	public String adminPage(Model model) {
		return "/admin/adminPage";
	}
	@GetMapping("/admin/managerPage")
	public String managerPage(Model model) {
		return "/admin/managerPage";
	}

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
	public String surportInsert(Model model, HttpSession session) {
		// 고객지원타입 리스트를 화면에 전송 -> 1.공지사항 , 2.문의사항
		// 글머리 리스트를 화면에 전송 -> 1.필독 , 2.공지 , 3.문의
		MemberVO loginUser = (MemberVO) session.getAttribute("user");
		ArrayList<SurportManageVO> surportManageList = surportService.getSurportManageList();
		ArrayList<UpHeadVO> upHeadList = surportService.getUpHeadList();
		
		model.addAttribute("loginUser", loginUser);// 회원정보
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
	
	@ResponseBody
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
	    boolean res = memberService.updateAuthority(memberInfo.getMe_id(), 
	    											memberInfo.getMe_authority(),
	    											memberInfo.getMe_state());
    	return map;
	}
	//회원관리 END
	//신고 START
	@GetMapping("/report/list")
	public String reportList(Model model, Criteria_report crir, String me_id) {
		crir.setPerPageNum(10);
		ArrayList<ReportVO> reportList = reportService.getReportList(me_id, crir);
		int totalCount = reportService.getReportTotalCount(crir);
		PageMaker_report pmr = new PageMaker_report(5, crir, totalCount);
		model.addAttribute(pmr);
		model.addAttribute("title", "신고 게시판");
		model.addAttribute("list", reportList);
		return "/report/list";
	}
	@GetMapping("/report/insertProduct")
	public String reportInsertProd(Model model, int rePrNum) {
		//거래글 리스트에서 하나의 거래글만 가져옴
		ProductVO productList = reportService.getRePrNum(rePrNum);
		model.addAttribute("info", productList);
		model.addAttribute("title", "거래글 신고");
		return "/report/insertProduct";
	}

	@PostMapping("/report/insertProduct")
	public String reportInsertProdPost(Model model, ReportVO report, MemberVO member, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = reportService.insertReportProd(report, user);
		if(res) {
			model.addAttribute("msg", "거래글 신고완료");
			model.addAttribute("url", "/product/list");
		}else {
			model.addAttribute("msg", "거래글 신고실패");
			model.addAttribute("url", "/");
		}
		return "message";
	}
	
	@PostMapping("/reportCount")
	public String reportCount(Model model, MemberVO user, HttpSession session) {
		 // 요청에서 사용자 ID와 신고 횟수를 가져옴
		int userId = (int) session.getAttribute("userId");
		int meReportCount = (int) session.getAttribute("meReportCount");
	    
	    // 사용자의 신고 횟수를 증가시킴
	    memberService.addReportCount(user, meReportCount);
	    
	    // 업데이트된 신고 횟수를 가진 사용자 정보를 가져옴
	    MemberVO member = memberService.getMemberById(user);
	    
	    // 뷰로 전달할 데이터를 모델에 추가
	    model.addAttribute("member", member);
	    
	    // 신고 작업 후 사용자에게 표시할 페이지의 이름 반환
	    return "/report/list";
	}
	
	@GetMapping("/report/insertChat")
	public String reportInsert(Model model, int cr_num) {
		model.addAttribute("cr_num", cr_num);
	    model.addAttribute("title", "거래글 신고");
	    return "/report/insertChat";
	}
	
	//채팅방 신고
	@PostMapping("/report/insertChat")
	public String reportInsertPost(Model model, ReportVO report, HttpSession session, int cr_num) {

		System.out.println(report);
		System.out.println(cr_num);
		boolean res = reportService.insertReportByIBH(report, cr_num);
		if(res) {
			model.addAttribute("msg", "신고 성공!");
			model.addAttribute("url", "/report/list");
		}else {
			model.addAttribute("msg", "신고 실패!");
			model.addAttribute("url", "/report/insertChat?cr_num=" + cr_num);
		}
		return "message";
	}
	
	//신고 상세내역
	@GetMapping("/report/detailProduct")
	public String detailProduct(Model model, int reNum) {
		ReportVO report = reportService.getReport(reNum);
		model.addAttribute("report", report);
		model.addAttribute("title", "신고글 상세내역");
		return "/report/detailProduct";
	}
	
	@ResponseBody
	@PostMapping("/report/list")
	public Map<String, Object> updateReState(Model model, ReportVO reportInfo, MemberVO memberInfo, HttpSession session){
		Map<String, Object> map = new HashMap<String, Object>();
		System.out.println(reportInfo);

		boolean res = reportService.updateReState(reportInfo.getRe_pr_num(),
												  reportInfo.getRe_state(),
												  memberInfo.getMe_state());
		
		int date = 0;
		switch (reportInfo.getRe_state()) {
			case "기간정지 : 3일":
				date = 3;
				break;
			case "기간정지 : 7일":
				date = 7;
				break;
			case "기간정지 : 14일":
				date = 14;
				break;
			case "기간정지 : 21일":
				date = 21;
				break;
			default:
				break;
		}
		
		ProductVO pro;
		if(reportInfo.getRe_pr_num() != 0) {
			pro = productService.getProductInfo(reportInfo.getRe_pr_num());
			boolean res2 = reportService.updateStateMember(date, pro.getPr_me_id());
		}else {
			// 채팅방 정보 
			ArrayList<ChatStateVO> idList = chatService.getChatState(reportInfo.getRe_cr_num());
			if(idList.get(0).getCs_me_id().equals(reportInfo.getRe_me_id())) {	// idList(0)이 신청자일 경우
				reportService.updateStateMember(date, idList.get(0).getCs_me_id());	// 인덱스 0번이 아닌 1번을 제제
			}else {	// idList(0)이 신청자가 아닌 경우 => idList(1)이 신청자인 경우
				reportService.updateStateMember(date, idList.get(1).getCs_me_id());	// 인덱스 1번이 아닌 0번을 제제
			}
		}
		
		System.out.println(res);
		return map;
	}
	
	//신고 END
	@GetMapping("/admin/inquityManager")
	public String InquityManager(Model model) {
		return "/admin/inquityManager";
	}

	@GetMapping("/fixed/list")
	// 고정 문의글 리스트
	public String surportManageList(Model model, Criteria_supot cris) {
		cris.setPerPageNum(10);
		ArrayList<FixedVO> fixList = fixedService.getFixList(cris);
		int totalCount = fixedService.getFixTotalCount(cris);
		PageMaker_supot pms = new PageMaker_supot(5, cris, totalCount);
		model.addAttribute("pms", pms);
		model.addAttribute("title", "고정문의");
		model.addAttribute("list", fixList);
		return "/fixed/list";
	}
	
	@GetMapping("/fixed/insert")
	//고정 문으글 추가 
	//고정 문의글은 admin, manager만 작성 가능하며 user는 조회만 가능하다 
	public String fixedInsert(Model model) {
		model.addAttribute("title", "고정문의 작성");
		return "/fixed/insert";
	}
	
	@PostMapping("/fixed/insert")
	public String fixedInsertPost(Model model, FixedVO fixed, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		boolean res = fixedService.insertFixPost(fixed, user);
		System.out.println(fixed);
		if(res) {
			model.addAttribute("msg", "고정문의글 작성이 완료되었습니다.");
			model.addAttribute("url", "/fixed/list");
		}else {
			model.addAttribute("msg", "고정문의글 작성이 실패하였습니다.");
			model.addAttribute("url", "/fixed/insert");
		}
		return "message";
	}
	
	@GetMapping("/fixed/detail")
	public String fixDetail(Model model, int fixNum) {
		fixedService.fixUpdateView(fixNum);
		FixedVO fixed = fixedService.getFixed(fixNum);
		model.addAttribute("fixed", fixed);
		model.addAttribute("title", "고정문의 상세내역");
		return "/fixed/detail";//웹페이지 구성해야 함
	}
	
	@GetMapping("/fixed/delete")
	public String fixedDelete(Model model, int fixNum, HttpSession session) {
		MemberVO user = (MemberVO)session.getAttribute("user");
		boolean res = fixedService.fixedDelete(fixNum, user);
		if(res) {
			model.addAttribute("url", "/fixed/list");
			model.addAttribute("msg", "삭제 처리되었습니다.");
		}else {
			model.addAttribute("url", "/fixed/detail?fixNum="+fixNum);
			model.addAttribute("msg", "삭제 처리 중 오류가 발생하였습니다.");
		}
		return "message";
	}


}
