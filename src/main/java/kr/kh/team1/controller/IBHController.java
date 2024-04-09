package kr.kh.team1.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.service.ChatService;

@Controller
public class IBHController {

	@Autowired
	ChatService chatService;
	
	@GetMapping("/chat/chatList")
	public String makeChatRoom(Model model, HttpSession session) {
	
		int pr_num = 1;	// 임시 제품번호W
		
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