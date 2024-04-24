package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.dto.MessageDTO;
import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.ChatStateVO;

public interface ChatService {
	
	ChatRoomVO getChatRoom(String me_id, int pr_num);

	ChatRoomVO getChatRoomByUser(String me_id, int cr_num);

	ChatRoomVO getChatRoomBySeller(String me_id, int cr_num);

	void insertChatRoom(String me_id, int pr_num);

	boolean insertChat(MessageDTO message);

	ArrayList<ChatMessageVO> getChatMessageList(int cr_num);

	void insertChatRoomState(String me_id, int pr_num);

	ArrayList<ChatRoomVO> getChatRoomByUserList(String me_id);

	void updateChatRoomStateById(int num, String me_id);

	ArrayList<ChatStateVO> getChatState(int num);

	void deleteChatRoomAndStateByNum(int num);
}