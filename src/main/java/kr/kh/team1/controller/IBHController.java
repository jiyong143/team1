package kr.kh.team1.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.service.ChatService;
import kr.kh.team1.utils.SseEmitters;

@RestController
public class IBHController {

	@Autowired
	ChatService chatService;
	
	private final SseEmitters sseEmitters; 
	
	@Autowired 
	public IBHController(SseEmitters sseEmitters) {  
		this.sseEmitters = sseEmitters;  
	}  
	
	@RequestMapping(value = "/ex1")
	public ModelAndView ex1(ModelAndView mv,String name, Integer age) {
		System.out.println("예제1 - 화면에서 전달한 이름 : " + name);
		System.out.println("예제1 - 화면에서 전달한 나이 : " + age);
		mv.setViewName("/main/ex1");
		return mv;
	}
	
	@GetMapping(value = "/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)  
	  public ResponseEntity<SseEmitter> connect() {  
	      SseEmitter emitter = new SseEmitter(60 * 1000L);
	      sseEmitters.add(emitter);
	      try {  
	          emitter.send(SseEmitter.event()
	                  .name("connect")  
	                  .data("connected!"));
	          count();
	      } catch (IOException e) {  
	          throw new RuntimeException(e);  
	      }  
	      return ResponseEntity.ok(emitter);
	  }  
	
	  @GetMapping("/count")  
	  public ResponseEntity<Void> count() {  
	      sseEmitters.count();
	      return ResponseEntity.ok().build();
	  }  
	
	
	@GetMapping("/chat/chatList")
	public String makeChatRoom(Model model, HttpSession session) {
	
		int pr_num = 1;	// 임시 제품번호
		
		// 로그인한 회원
		MemberVO user = (MemberVO)session.getAttribute("user");

		// 회원과 판매글을 가지고 채팅방이 생성되었는지 확인
		ChatRoomVO room = chatService.getChatRoom(user.getMe_id(), pr_num);

		if(room == null) {
			// 존재하지 않으면 채팅방 객체를 생성해서 서비스에게 채팅방을 만들라고 시킴
			chatService.insertChatRoom(user.getMe_id(), pr_num);
		}
		
		ArrayList<ChatRoomVO> chatRoomList =  chatService.selectChatRoomList(user.getMe_id());
		model.addAttribute("chatRoomList", chatRoomList);
		
		return "/chat/chatList";
	}
	
}