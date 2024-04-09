package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.ChatRoomVO;

public interface ChatService {

	ChatRoomVO getChatRoom(String user, int pr_num);

	boolean insertChatRoom(String me_id, int pr_num);

	ArrayList<ChatRoomVO> selectChatRoomList(String me_id);
}