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
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.service.ChatService;
import kr.kh.team1.utils.SseEmitters;

@Controller
public class IBHController {

	@Autowired
	ChatService chatService;
	
	private final SseEmitters sseEmitters; 
	
	@Autowired 
	public IBHController(SseEmitters sseEmitters) {  
		this.sseEmitters = sseEmitters;  
	}  

	@GetMapping("/chat/sse")
	public String sse(Model model, int cr_num, HttpSession session) {
		
		MemberVO loginUser = (MemberVO)session.getAttribute("user");
		ChatRoomVO crv = chatService.getChatRoomByUser(loginUser.getMe_id(), cr_num);
		if(crv == null) {
			crv = chatService.getChatRoomBySeller(loginUser.getMe_id(), cr_num);	// 판매자
		}
		if(crv == null) {
			return "/main/home";
		}
		model.addAttribute("cr_num", cr_num);
		return "/chat/sse";
	}
	
    @GetMapping("/chat/list")
    // 채팅방 리스트
   	public String chatRoomList(Model model, HttpSession session) {
    	
    	MemberVO loginUser = (MemberVO)session.getAttribute("user");
    	
    	// 채팅방에 대한 정보
    	ArrayList<ChatRoomVO> crv = chatService.getChatRoomByUserList(loginUser.getMe_id());	// 구매자
    	if(crv.size() == 0) {
    		crv = chatService.getChatRoomBySellerList(loginUser.getMe_id());	// 판매자
    	}
    	
    	model.addAttribute("crv", crv);
    	model.addAttribute("loginUser", loginUser);
	   	return "/chat/list";
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
		ChatRoomVO crv = chatService.getChatRoomByUser(loginUser.getMe_id(), cr_num);	// 구매자
		if(crv == null)
			crv = chatService.getChatRoomBySeller(loginUser.getMe_id(), cr_num);	// 판매자
		
		System.out.println(crv);
		SseEmitter emitter;

		if(loginUser .getMe_id().equals(crv.getProduct().getPr_me_id())) {
			// msg를 보낼 상대방의 에미터를 가져옴
			emitter = sseEmitters.get(crv.getCr_me_id());
		}else {
			emitter = sseEmitters.get(crv.getProduct().getPr_me_id());
		}
		
		if(emitter == null)
			return "상대방이 로그인을 하지 않았습니다.";
		
		try { 
			MessageDTO message = new MessageDTO(crv.getCr_num() ,loginUser.getMe_id(), msg);
			
			emitter.send(SseEmitter.event()
	              .name("receive")
	              .data(message));
			
			chatService.insertChat(message);
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
		ArrayList<ChatMessageVO> msg = chatService.getChatMessageList(cm_cr_num);
		MemberVO loginUser = (MemberVO)session.getAttribute("user");
		map.put("msgs", msg);
		map.put("loginUser", loginUser);
		return map;
	}
}