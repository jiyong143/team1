package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.dto.MessageDTO;
import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.TopGroupVO;

public interface ChatService {

	ChatRoomVO getChatRoom(String user, int pr_num);

	boolean insertChatRoom(String me_id, int pr_num);

	ArrayList<ChatRoomVO> selectChatRoomList(String me_id);

	boolean insertChat(MessageDTO message);

	ArrayList<ChatMessageVO> getChatMessageList(int cr_num);
}