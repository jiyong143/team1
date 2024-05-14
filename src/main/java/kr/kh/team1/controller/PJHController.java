package kr.kh.team1.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team1.model.dto.LoginDTO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.PaymentVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReviewTypeVO;
import kr.kh.team1.model.vo.TradeOutcomeVO;
import kr.kh.team1.model.vo.ZipcodeVO;
import kr.kh.team1.service.MemberService;
import kr.kh.team1.service.PaymentService;
import kr.kh.team1.service.ProductService;
import kr.kh.team1.service.ReviewService;
import kr.kh.team1.service.TopGroupService;

@Controller
public class PJHController {

	@Autowired
	MemberService memberService;

	@Autowired
	ProductService productService;

	@Autowired
	PaymentService paymentService;

	@Autowired
	ReviewService reviewService;
	
	@Autowired
	TopGroupService topGroupService;

	@GetMapping("/main/home")
	public String home(Model model) {
		MemberVO dateTest = memberService.getMemberDate();
		model.addAttribute("test1", dateTest);
		return "/main/home";
	}

	@GetMapping("/member/signup")
	public String signup(Model model) {
		model.addAttribute("title", "회원가입");
		ArrayList<ZipcodeVO> sidoList = topGroupService.getSidoList();
		model.addAttribute("sidoList", sidoList);
		return "/member/signup";
	}

	@PostMapping("/member/signup")
	public String signupPost(Model model, MemberVO member, ZipcodeVO zip) {
		
		String place = zip.getSido() + " " + zip.getSigungu() + " " + zip.getH_dong_nm();
		member.setMe_addr(place);
		
		boolean res = memberService.signup(member);
		if (res) {
			model.addAttribute("msg", "회원가입을 성공했습니다.");
			model.addAttribute("url", "/");
		} else {
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
		model.addAttribute("user", user);// user라는 이름으로 전송
		session.setAttribute("user", user);
		if (user != null) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "로그인을 했습니다.");
		} else {
			model.addAttribute("url", "/member/login");
			model.addAttribute("msg", "로그인을 하지 못했습니다.");
		}
		return "message";
	}

	@ResponseBody
	@GetMapping("/id/check/dup")
	public Map<String, Object> idCheckDup(@RequestParam("id") String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean res = memberService.idCheck(id);
		map.put("result", res);
		return map;
	}

	@ResponseBody
	@GetMapping("/email/check/dup")
	public Map<String, Object> emailCheckDup(@RequestParam("email") String email, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (session.getAttribute("user") != null) {
			MemberVO member = (MemberVO) session.getAttribute("user");
			if (member.getMe_email().equals(email)) {
				map.put("result", true);
			} else {
				boolean res = memberService.emailCheck(email);
				map.put("result", res);
			}
		} else {
			boolean res = memberService.emailCheck(email);
			map.put("result", res);
		}

		return map;
	}

	@ResponseBody
	@GetMapping("/phone/check/dup")
	public Map<String, Object> phoneCheckDup(@RequestParam("phone") String phone, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();

		if (session.getAttribute("user") != null) { // user가 null이 아니라는 것은 로그인을 했다는 뜻 == 회원정보 수정
			MemberVO member = (MemberVO) session.getAttribute("user");
			if (member.getMe_phone().equals(phone)) {
				map.put("result", true);
			} else {
				boolean res = memberService.phoneCheck(phone);
				map.put("result", res);
			}
		} else {
			boolean res = memberService.phoneCheck(phone);
			map.put("result", res);
		}

		return map;
	}

	@ResponseBody
	@GetMapping("/birth/check/dup")
	public Map<String, Object> birthCheckDup(@RequestParam("birth") String birth) {
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
		if (me_id == null) {
			myUser = (MemberVO) request.getSession().getAttribute("user");
			model.addAttribute("myUserCheck", myUser.getMe_id());

		} else {
			myUser = memberService.getMember(me_id);
			model.addAttribute("myUserCheck", me_id);
		}
		ArrayList<PaymentVO> paymentList = memberService.getPaymentList(myUser.getMe_id());
		model.addAttribute("paymentList", paymentList);

		int tradeNum = -1;
		tradeNum = memberService.getTradeNum(myUser.getMe_id()); //안전거래
		
		int reviewNum = -1;
		reviewNum = memberService.getReviewNum(myUser.getMe_id()); //거래후기

		int tradeReviewNum = -1;
		tradeReviewNum = reviewService.getReviewProList(myUser.getMe_id()).size(); //후기작성
		
		ArrayList<ReviewTypeVO> reviewList = reviewService.getReviewList(); //db에 작성한 후기 타입들
		
		ArrayList<TradeOutcomeVO> reviewList0 = reviewService.getMyReviewList0(myUser.getMe_id()); //판매자일 때 구매자에게 받은 후기
		ArrayList<TradeOutcomeVO> reviewList1 = reviewService.getMyReviewList1(myUser.getMe_id()); //구매자일 떄 판매자에게 받은 후기 <-- 문제
		for(ReviewTypeVO i : reviewList) {
			for(TradeOutcomeVO j : reviewList0) {
				if(i.getRt_type().equals(j.getTo_rt_type())) {
					i.setCount(i.getCount()+1);
				}
			}
		}
		
		for(ReviewTypeVO i : reviewList) {
			for(TradeOutcomeVO j : reviewList1) {
				if(i.getRt_type().equals(j.getTo_rt_type())) {
					i.setCount(i.getCount()+1);
				}
			}
		}
		
		model.addAttribute("reviewList", reviewList);
		
		model.addAttribute("myUser", myUser);
		model.addAttribute("tradeNum", tradeNum);
		model.addAttribute("reviewNum", reviewNum);
		model.addAttribute("tradeReviewNum", tradeReviewNum);
		model.addAttribute("listSize", 0);

		return "/member/mypage";
	}

	@ResponseBody
	@GetMapping("/member/mypage/all")
	public Map<String, Object> mypageProduct(Model model, HttpServletRequest request,
			@RequestParam("clickData") String clickData, @RequestParam("type") String type,
			@RequestParam("userId") String userId) {

		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO sessionMember = (MemberVO) request.getSession().getAttribute("user");
		MemberVO myUser;

		if (userId == null) { // 자신의 마이페이지를 확인하는 경우
			myUser = sessionMember; // 세션에 저장되어 있는(로그인 한 아이디) 아이디를 불러와서 출력
			model.addAttribute("myUserCheck", myUser.getMe_id());
		} else { // 다른 회원의 마이페이지를 확인하는 경우
			myUser = memberService.getMember(userId);
			model.addAttribute("myUserCheck", userId);
		}

		ArrayList<ProductVO> list;
		list = productService.getMypagePro(myUser.getMe_id(), clickData, type);

		if (list.size() == 0) {
			model.addAttribute("listSize", list.size());
			map.put("list", list);

			return map;
		}

		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		for (int i = 0; i < list.size(); i++) {
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
	public String payment(Model model, @RequestParam("orderUid") String orderUid,
			@RequestParam("paymentPrice") int paymentPrice, @RequestParam("userId") String userId, @RequestParam("now")Date now,
			HttpSession session) {
		memberService.addPoint(paymentPrice, userId);
		paymentService.addPayment(orderUid, paymentPrice, userId, now);
		MemberVO user = memberService.getMember(userId);
		session.removeAttribute("user");
		session.setAttribute("user", user);

		// 새로고침해야 바뀐 포인트 값이 마이페이지에 적용됨

		return "message";
	}

	@ResponseBody
	@PostMapping("/member/createNum")
	public Map<String, Object> createNum(@RequestParam("id") String userId) {
		Map<String, Object> map = new HashMap<String, Object>();

		Random random = new Random();
		String orderUID;

		while (true) {
			random.nextInt(100000);
			orderUID = userId + "_" + random.nextInt(100000); // 사용자의 아이디 + _ + 랜덤값(0~100000)
			boolean res = paymentService.getPaymentList(orderUID); // db에 저장되어 있는지 확인하는 작업
			if (res) {
				break;
			}
		}

		map.put("orderUID", orderUID);
		return map;
	}
	
	@GetMapping("/member/update")
	public String updateMember(Model model, HttpSession session) {
		model.addAttribute("title", "회원정보수정");
		MemberVO member = (MemberVO) session.getAttribute("user");
		model.addAttribute("member", member);
		return "/member/update";
	}

	@PostMapping("/member/update")
	public String updateMemberPost(Model model, MemberVO member, HttpSession session) {
		boolean res = memberService.updateMember(member);
		if (res) {
			MemberVO user = memberService.getMember(((MemberVO) session.getAttribute("user")).getMe_id());
			session.removeAttribute("user");
			session.setAttribute("user", user);

			model.addAttribute("msg", "회원정보를 수정했습니다.");
			model.addAttribute("url", "/");
		} else {
			model.addAttribute("msg", "회원정보 수정에 실패했습니다.");
			model.addAttribute("url", "/member/update");
		}

		return "message";
	}

	@GetMapping("/member/delete")
	public String deleteMember(Model model, HttpSession session) {
		MemberVO user = memberService.getMember(((MemberVO) session.getAttribute("user")).getMe_id());
		memberService.deleteMember(user.getMe_id());
		session.removeAttribute("user");
		model.addAttribute("msg", "회원탈퇴에 성공했습니다.");
		model.addAttribute("url", "/");
		return "message";
	}

	@ResponseBody
	@PostMapping("/sns/{sns}/check/id")
	public boolean snsCheckId(@PathVariable("sns") String sns, @RequestParam("email") String email) {

		return memberService.idCheck(sns, email);
	}

	@GetMapping("/review/write")
	public String reviewWrite(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("user");
		String userId = user.getMe_id();
		ArrayList<ProductVO> reviewList = reviewService.getReviewProList(userId); // 리뷰가능한(판매자가 판매완료로 바꾸고 구매자를 특정한경우)
																			      // 판매글 리스트를 가져옴 (이미 리뷰한 글들은 다른 곳에서 볼
																				  // 수 있음)
		ArrayList<ReviewTypeVO> reviewType = reviewService.getReviewType();
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("reviewType", reviewType);
		return "/review/write";
	}

	@PostMapping("/review/write")
	public String reviewWritePost(Model model, @RequestParam("rt_type") ArrayList<String> reviewType, @RequestParam("prNum") int prNum, HttpSession session) {
		int trNum = reviewService.getTrNum(prNum);
		MemberVO user = (MemberVO) session.getAttribute("user");
		int mannerScore = 0;
		for(String i:reviewType) {
			mannerScore += reviewService.getReviewScore(i);
		}
		boolean res = reviewService.addReview(reviewType, trNum, user.getMe_id(), mannerScore);
		
		if(res) {
			model.addAttribute("msg", "리뷰 작성에 성공했습니다.");
			model.addAttribute("url", "/review/write");
		} else {
			model.addAttribute("msg", "리뷰 작성에 실패했습니다.");
			model.addAttribute("url", "/review/write");
		}
		return "message";
	}
	
	@PostMapping("/review/write/delete")
	public String reviewDelete(Model model, @RequestParam("reviewDeleteVal")int reviewDeleteVal, HttpSession session) {
		String userId = ((MemberVO)session.getAttribute("user")).getMe_id();
		reviewService.deleteReview(reviewDeleteVal, userId);
		
		return "/review/write";
	}

//	@ResponseBody
//	@PostMapping("/sns/{sns}/signup")
//	public boolean snsSignup(@PathVariable("sns")String sns, @RequestParam("id")String id,@RequestParam("email")String email ) {
//		
//		return memberService.signupSns(sns, id, email);
//	}

//	@ResponseBody
//	@PostMapping("/sns/{sns}/login")
//	public boolean snsLogin(@PathVariable("sns")String sns, @RequestParam("id")String id, HttpSession session) {
//		MemberVO user = memberService.loginSns(sns, id); 
//		session.setAttribute("user", user);
//		return user != null;
//	}

}