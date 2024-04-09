package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.ChatDAO;
import kr.kh.team1.model.vo.ChatRoomVO;

@Service
public class ChatServiceImp implements ChatService {

	@Autowired
	ChatDAO chatDao;

	@Override
	public ChatRoomVO getChatRoom(String user, int pr_num) {
		if(user == null || pr_num == 0)
			return null;
		return chatDao.selectChatRoom(user, pr_num);
	}

	@Override
	public boolean insertChatRoom(String me_id, int pr_num) {
		if(me_id == null || pr_num == 0) 
			return false;
		
		return chatDao.insertChatRoom(me_id, pr_num);
	}

	@Override
	public ArrayList<ChatRoomVO> selectChatRoomList(String me_id) {
		if(me_id == null) 
			return null;
		
		return chatDao.selectChatRoomList(me_id);
	}

}