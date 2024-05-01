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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.team1.model.dto.MessageDTO;
import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.ChatStateVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.ZipcodeVO;
import kr.kh.team1.pagination.Criteria;
import kr.kh.team1.pagination.PageMaker_chat;
import kr.kh.team1.service.ChatService;
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
	
	@GetMapping("/chat/sse")
	// 채팅방에 해당하지 않는 사람들 막기
	public String sse(Model model, int cr_num, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("user");
		
		ChatRoomVO crv = chatService.getChatRoomByUser(loginUser.getMe_id(), cr_num);
		if(crv == null) {
			crv = chatService.getChatRoomBySeller(loginUser.getMe_id(), cr_num);	// 판매자
		}
		
		ArrayList<ChatStateVO> cs = chatService.getChatState(cr_num);
		
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
    	
    	PageMaker_chat pm = new PageMaker_chat(3, cri, totalListCount);
    	
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
		
		chatTotalCount = 2;
		return "";
	}
}