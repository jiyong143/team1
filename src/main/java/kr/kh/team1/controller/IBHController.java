package kr.kh.team1.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.team1.model.dto.MessageDTO;
import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.ChatStateVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.ReportVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.model.vo.ZipcodeVO;
import kr.kh.team1.pagination.Criteria;
import kr.kh.team1.pagination.PageMaker_chat;
import kr.kh.team1.service.ChatService;
import kr.kh.team1.service.MemberService;
import kr.kh.team1.service.TopGroupService;
import kr.kh.team1.utils.SseEmitters;

@Controller
public class IBHController {
	
	@Autowired
	ChatService chatService;
	
	@Autowired
	TopGroupService topGroupService;
	
	private final SseEmitters sseEmitters; 
	
	private static int chatTotalCount;
	
	@Autowired 
	public IBHController(SseEmitters sseEmitters) {  
		this.sseEmitters = sseEmitters;  
	}  

	@ResponseBody
	@GetMapping("/product/sigungu")
	// 상품 등록 군/구
	public Map<String, Object> sigungu(@RequestParam("sido") String sido){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ZipcodeVO> sigunguList = topGroupService.getSigunguList(sido);
		map.put("sigunguList", sigunguList);
		return map;
	}
	
	@ResponseBody
	@GetMapping("/product/dong")
	// 상품 등록 동
	public Map<String, Object> dong(@RequestParam("sido") String sido, @RequestParam("sigungu") String sigungu){
		HashMap<String, Object> map = new HashMap<String, Object>();

		ArrayList<ZipcodeVO> dongList = topGroupService.getDongList(sido, sigungu);
		map.put("dongList", dongList);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/product/delete")
	// 상품 삭제
	public Map<String, Object> productDeletePost(HttpSession session, int pr_num) {
		Map<String, Object> map = new HashMap<String, Object>();

		// 제품 번호 주고 해당 제품에 신고 확인
		ArrayList<ReportVO> rpProList = chatService.getReportByProduct(pr_num);
		
		// 제품 번호 주고 채팅방 가져오기
		ArrayList<ReportVO> rpChat = chatService.getReportByChat(pr_num);
		
		System.out.println(rpChat);
		System.out.println(rpProList);
		
		if(rpChat.size() == 0 && rpProList.size() == 0) {
			chatService.deleteProduct(pr_num);	// 파일 및 내용 다 삭제
		}else {
			chatService.updateProduct(pr_num);	// 유저들이 보이지 않게 삭제중으로 변경 후 (신고 제제 후 삭제 : 추가 예정)
		}
		map.put("msg", "삭제했습니다.");
		return map;
	}
	
	@GetMapping("/chat/sse")
	// 채팅방에 해당하지 않는 사람들 막기
	public String sse(Model model, int cr_num, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("user");
		ChatRoomVO crv = chatService.getChatRoomByUser(loginUser.getMe_id(), cr_num);
		if(crv == null) {
			crv = chatService.getChatRoomBySeller(loginUser.getMe_id(), cr_num);	// 판매자
		}
		
		ArrayList<ChatStateVO> cs = chatService.getChatState(cr_num);
		if(loginUser.getMe_authority().equals("user")) {
			if (cs.isEmpty()) {
			    model.addAttribute("error", "없는 채팅방입니다.");
			}else {
				ChatStateVO cs0 = cs.get(0);
				ChatStateVO cs1 = cs.get(1);
				if(!cs0.getCs_me_id().equals(loginUser.getMe_id()) && !cs1.getCs_me_id().equals(loginUser.getMe_id())) {
					model.addAttribute("error", "들어갈 수 없는 채팅방입니다.");
				}else if((cs0.getCs_me_id().equals(loginUser.getMe_id()) && cs0.getCs_state().equals("나감")) ||
						(cs1.getCs_me_id().equals(loginUser.getMe_id()) && cs1.getCs_state().equals("나감"))){
					model.addAttribute("error", "나간 채팅방입니다.");
				}
			}
		}
		
		int totalMsgCount = chatService.getTotalMsgCount(cr_num);
		model.addAttribute("totalMsgCount", totalMsgCount);
		model.addAttribute("chatTotalCount", chatTotalCount);
		model.addAttribute("cr_num", cr_num);
		return "/chat/sse";
	}
	
	@ResponseBody
	@PostMapping("/chat/out")
	// 해당 채팅방 나가기
	public Map<String, Object> chatRoomOut(@RequestParam("num") int num, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		MemberVO loginUser = (MemberVO)session.getAttribute("user");
		chatService.updateChatRoomStateById(num, loginUser.getMe_id());	// 로그인 유저의 채팅방 상태 변경
		ArrayList<ChatStateVO> cs = chatService.getChatState(num);	// 채팅방 번호에 해당하는 회원들의 상태
		
		if(cs.get(0).getCs_state().equals("나감") && !cs.get(0).getCs_me_id().equals(loginUser.getMe_id())) {
			chatService.deleteChatRoomAndStateByNum(num);		// 채팅방 번호에 맞는 채팅방 삭제
		}else if(cs.get(1).getCs_state().equals("나감") && !cs.get(1).getCs_me_id().equals(loginUser.getMe_id())){
			chatService.deleteChatRoomAndStateByNum(num);		// 채팅방 번호에 맞는 채팅방 삭제
		}
		
		map.put("num", num);
		return map;
	}
	
    @GetMapping("/chat/list")
    // 채팅방 리스트
   	public String chatRoomList(Model model, HttpSession session, int page) {
    	Criteria cri = new Criteria();
    	cri.setPerPageNum(5);	// 한 페이지에 게시글 5개 지정
    	cri.setPage(page);
    	
    	MemberVO loginUser = (MemberVO)session.getAttribute("user");
    	
    	// 채팅방에 대한 정보
    	ArrayList<ChatRoomVO> crv = chatService.getChatRoomByUserList(loginUser.getMe_id(), cri);
    	
    	int totalListCount = chatService.getChatRoomTotalCount(loginUser.getMe_id(), cri);
    	
    	PageMaker_chat pm = new PageMaker_chat(5, cri, totalListCount);
    	
    	model.addAttribute("crv", crv);
    	model.addAttribute("loginUser", loginUser);
    	model.addAttribute("pm", pm);
	   	return "/chat/list";
	}
    
    @ResponseBody
	@PostMapping("/chat/more")
	// 해당 채팅방 메시지 더보기
	public Map<String, Object> chatMsgMore(@RequestParam("cm_cr_num") int cm_cr_num, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		chatTotalCount += 1;
		int totalMsgCount = chatService.getTotalMsgCount(cm_cr_num);
		map.put("totalMsgCount", totalMsgCount);
		map.put("chatCount", chatTotalCount);
		return map;
	}

    @ResponseBody
	@GetMapping(value = "/sse/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)  
	public ResponseEntity<SseEmitter> connect(HttpSession session) { 
		
		SseEmitter emitter = new SseEmitter(60 * 1000L);  
		MemberVO loginUser = (MemberVO)session.getAttribute("user");
		
		if(loginUser == null)
			return ResponseEntity.ok(emitter);	// 연결 성공 여부
		sseEmitters.add(loginUser.getMe_id(), emitter);
		
		try {  
			emitter.send(SseEmitter.event()
	              .name("connect")  
	              .data("connected!"));  
		} catch (IOException e) {  
			throw new RuntimeException(e);  
		}  
		return ResponseEntity.ok(emitter);  
	}
	
	
    @ResponseBody
	@PostMapping(value = "/sse/send", produces = "application/text; charset=UTF-8")  
	public String send(HttpSession session, @RequestParam("msg") String msg, @RequestParam("cr_num") int cr_num) {  
		
		MemberVO loginUser = (MemberVO)session.getAttribute("user");
		if(loginUser == null)
			return "로그인을 하지 않았습니다.";
		
		// 회원 + 상품 번호 채팅방 가져옴
		ChatRoomVO crv = chatService.getChatRoomByUser(loginUser.getMe_id(), cr_num);	// 구매자 기준
		if(crv == null)
			crv = chatService.getChatRoomBySeller(loginUser.getMe_id(), cr_num);	// 판매자 기준
		
		SseEmitter emitter;

		if(loginUser .getMe_id().equals(crv.getProduct().getPr_me_id())) {
			// msg를 보낼 상대방의 에미터를 가져옴
			emitter = sseEmitters.get(crv.getCr_me_id());
		}else {
			emitter = sseEmitters.get(crv.getProduct().getPr_me_id());
		}
		
		MessageDTO message = new MessageDTO(crv.getCr_num() ,loginUser.getMe_id(), msg);
		
		if(emitter == null) {
			chatService.insertChat(message);
			chatTotalCount++;
			return "상대방이 로그인을 하지 않았습니다.";
		}
		
		try {
			chatService.insertChat(message);
			ChatMessageVO cm = chatService.getChatMessageRecent(message.getCm_cr_num());
			message.setCm_time(cm.getDate_str());
			
			emitter.send(SseEmitter.event()
	              .name("receive")
	              .data(message));
			chatTotalCount++;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return "전송을 성공했습니다.";  
	}
    
	@ResponseBody
	@PostMapping("/sse/list")
	// 해당 채팅방 메시지 리스트
	// 리턴타입 꼭 Object일 필요는 없음. List로 보내고 싶으면 List로 수정해도 상관없음 
	public Map<String, Object> list(@RequestParam("cm_cr_num") int cm_cr_num, HttpSession session){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		ArrayList<ChatMessageVO> msg = chatService.getChatMessageList(cm_cr_num, chatTotalCount);
		MemberVO loginUser = (MemberVO)session.getAttribute("user");
		map.put("msgs", msg);
		map.put("loginUser", loginUser);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/sse/close")
	// 채팅방 나갈때 chatTotalCount 초기화
	public String close(@RequestParam("cm_cr_num") int cm_cr_num, HttpSession session){
		
		chatTotalCount = 5;
		return "";
	}
	
	@GetMapping("/admin/topCategoryManager")
	// 대분류 페이지
	public String topCategoryManager(Model model, Criteria cri) {
		
		cri.setPerPageNum(5);
		ArrayList<TopGroupVO> topList = topGroupService.getTopGroupListByCri(cri);
		int totalTopGroupCount = topGroupService.getTopGroupTotalCount();
		PageMaker_chat pm = new PageMaker_chat(5, cri, totalTopGroupCount);
		
		model.addAttribute("topList", topList);
		model.addAttribute("pm", pm);
	    return "/admin/topCategoryManager";
	}
	
	@ResponseBody
	@PostMapping("/admin/topCategoryManager")
	// 대분류 추가
	public Map<String, Object> topCategoryManagerPost(String topGroup) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		TopGroupVO tg = topGroupService.getTopGroupByTitle(topGroup);
		if(tg != null) {
			map.put("msg", "해당 대분류는 이미 존재하는 대분류입니다.");
			return map;
		}
		
		boolean res = topGroupService.insertTopGroup(topGroup);
		if(res) {
			map.put("msg", "추가했습니다.");
		}else {
			map.put("msg", "추가하지 못했습니다.");
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/admin/updateTopCategoryManager")
	// 대분류 수정
	public Map<String, Object> updateTopCategoryManagerPost(int tg_num, String topGroup) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		TopGroupVO tg = topGroupService.getTopGroupByTitle(topGroup);
		if(tg != null) {
			map.put("msg", "해당 대분류는 이미 존재하는 대분류입니다.");
			return map;
		}
		
		boolean res = topGroupService.updateTopGroup(tg_num, topGroup);
		if(res) {
			map.put("msg", "수정했습니다.");
		}else {
			map.put("msg", "수정하지 못했습니다.");
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/admin/deleteTopCategoryManager")
	// 대분류 삭제
	public Map<String, Object> deleteTopCategoryManagerPost(int tg_num) {
		Map<String, Object> map = new HashMap<String, Object>();

		boolean res = topGroupService.deleteTopGroup(tg_num);
		if(res) {
			map.put("msg", "삭제했습니다.");
		}else {
			map.put("msg", "삭제하지 못했습니다.");
		}
		return map;
	}
	
	@GetMapping("/admin/midCategoryManager")
	// 중분류 페이지
	public String midCategoryManager(Model model, Criteria cri) {
		ArrayList<TopGroupVO> topList = topGroupService.getTopGroupList();
	
		model.addAttribute("list", topList);
	    return "/admin/midCategoryManager";
	}
	
	@ResponseBody
	@PostMapping("/admin/midCategoryByTopManager")
	// 대분류에 맞는 중분류 출력
	public Map<String, Object> midCategoryByTopManagerPost(@RequestBody Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		cri.setPerPageNum(5);
		TopGroupVO tg = topGroupService.getTopGroupByTitle(cri.getSearch());
		
		ArrayList<MidGroupVO> midList = topGroupService.getMidGroupList(tg.getTg_num(), cri);
		
		for(int i = 0; i < midList.size(); i++) {
			midList.get(i).setMg_tg_title(cri.getSearch());
		}
		
		int totalMidGroupByTopCount = topGroupService.getTotalMidGroupByTopCount(tg.getTg_num(), cri);
		PageMaker_chat pm = new PageMaker_chat(5, cri, totalMidGroupByTopCount);
		
		map.put("pm", pm);
		map.put("midList", midList);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/admin/addMidCategoryManager")
	// 중분류 추가
	public Map<String, Object> addMidCategoryManagerPost(String midGroup, String tg) {
		Map<String, Object> map = new HashMap<String, Object>();

		TopGroupVO topg = topGroupService.getTopGroupByTitle(tg);
		MidGroupVO tgv = topGroupService.getMidGroupByTitle(topg.getTg_num(), midGroup);
		if(tgv != null) {
			map.put("msg", "해당 중분류는 이미 존재하는 중분류입니다.");
			return map;
		}
		
		boolean res = topGroupService.insertMidGroup(midGroup, topg.getTg_num());
		if(res) {
			map.put("msg", "추가했습니다.");
		}else {
			map.put("msg", "추가하지 못했습니다.");
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/admin/updateMidCategoryManager")
	// 중분류 수정
	public Map<String, Object> updateMidCategoryManagerPost(String tg, int tg_num, String midGroup) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		TopGroupVO topg = topGroupService.getTopGroupByTitle(tg);
		MidGroupVO tgv = topGroupService.getMidGroupByTitle(topg.getTg_num(), midGroup);
		if(tgv != null) {
			map.put("msg", "해당 중분류는 이미 존재하는 중분류입니다.");
			return map;
		}
		
		boolean res = topGroupService.updateMidGroup(tg_num, midGroup);
		if(res) {
			map.put("msg", "수정했습니다.");
		}else {
			map.put("msg", "수정하지 못했습니다.");
		}
		return map;
	}
	
	@ResponseBody
	@PostMapping("/admin/deleteMidCategoryManager")
	// 중분류 삭제
	public Map<String, Object> deleteMidCategoryManagerPost(int tg_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		boolean res = topGroupService.deleteMidGroup(tg_num);
		if(res) {
			map.put("msg", "삭제했습니다.");
		}else {
			map.put("msg", "삭제하지 못했습니다.");
		}
		return map;
	}
}