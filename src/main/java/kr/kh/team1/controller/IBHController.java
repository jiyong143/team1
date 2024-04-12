package kr.kh.team1.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.service.ChatService;


@RestController
public class IBHController {

	@Autowired
	ChatService chatService;
	
	private final SseEmitters sseEmitters; 
	
	@Autowired 
	public IBHController(SseEmitters sseEmitters) {  
		this.sseEmitters = sseEmitters;  
	}  

	
	@GetMapping(value = "/sse/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)  
	public ResponseEntity<SseEmitter> connect(HttpSession session) { 
		
		SseEmitter emitter = new SseEmitter(60 * 1000L);  
		MemberVO user = (MemberVO)session.getAttribute("user");
		
		if(user == null)
			return ResponseEntity.ok(emitter);	// 연결 성공 여부
		sseEmitters.add(user.getMe_id(), emitter);
		
		try {  
			emitter.send(SseEmitter.event()  
	              .name("connect")  
	              .data("connected!"));  
		} catch (IOException e) {  
			throw new RuntimeException(e);  
		}  
		return ResponseEntity.ok(emitter);  
	}
	
	
	@PostMapping(value = "/sse/send", produces = "application/text; charset=UTF-8")  
	public String send(HttpSession session, @RequestParam("msg") String msg) {  
		
		MemberVO user = (MemberVO)session.getAttribute("user");
		if(user == null)
			return "로그인을 하지 않았습니다.";
		
		// 회원 + 상품 번호 채팅방 가져옴
		int pr_num = 2;
		ChatRoomVO crv = chatService.getChatRoom(user.getMe_id(), pr_num);
		System.out.println(crv);
		SseEmitter emitter;

		if(user.getMe_id().equals(crv.getProduct().getPr_me_id())) {
			// msg를 보낼 상대방의 에미터를 가져옴
			emitter = sseEmitters.get(crv.getCr_me_id());
		}else {
			emitter = sseEmitters.get(crv.getProduct().getPr_me_id());
		}
	
		try { 
			MessageDTO message = new MessageDTO(crv.getCr_num() ,user.getMe_id(), msg);
			
			emitter.send(SseEmitter.event()
	              .name("receive")
	              .data(message));
			
			boolean res = chatService.insertChat(message);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return "전송을 성공했습니다.";  
	}
	
	@ResponseBody
	@GetMapping("/sse/list")
	public Map<String, Object> list(@RequestBody ChatMessageVO ChatMessageVo){
		Map<String, Object> map = new HashMap<String, Object>();
		int cr_num = 2;
		ArrayList<ChatMessageVO> chatMsg  = chatService.getChatMessageList(cr_num);
		map.put("list", chatMsg);
		return map;
	}
}