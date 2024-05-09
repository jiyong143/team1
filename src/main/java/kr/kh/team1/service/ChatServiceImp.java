package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.ChatDAO;
import kr.kh.team1.model.dto.MessageDTO;
import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.ChatStateVO;
import kr.kh.team1.pagination.Criteria;

@Service
public class ChatServiceImp implements ChatService {

	@Autowired
	ChatDAO chatDao;

	private boolean CheckStr(String str) {
		return str.length() != 0 && str != null;
	}

	@Override
	public ChatRoomVO getChatRoom(String me_id, int pr_num) {
		if(me_id == null)
			return null;
		return chatDao.selectChatRoom(me_id, pr_num);
	}
	
	@Override
	public ChatRoomVO getChatRoomByUser(String me_id, int cr_num) {
		if(me_id == null)
			return null;
		return chatDao.selectChatRoomByUser(me_id, cr_num);
	}

	@Override
	public ChatRoomVO getChatRoomBySeller(String me_id, int cr_num) {
		if(me_id == null)
			return null;
		return chatDao.selectChatRoomBySeller(me_id, cr_num);
	}
	
	@Override
	public void insertChatRoom(String me_id, int pr_num) {
		if(me_id == null) 
			return;
		chatDao.insertChatRoom(me_id, pr_num);
		return;
	}

	@Override
	public boolean insertChat(MessageDTO message) {
		if(!CheckStr(message.getCm_me_id()) ||
			!CheckStr(message.getCm_content()))
			return false;
		
		return chatDao.insertChat(message);
	}

	@Override
	public ArrayList<ChatMessageVO> getChatMessageList(int cr_num, int chatCount) {
		return chatDao.selectChatMessgeList(cr_num, chatCount);
	}

	@Override
	public void insertChatRoomState(String me_id, int pr_num) {
		if(me_id == null) 
			return;
		
		chatDao.insertChatRoomState(me_id, pr_num);
		return;
	}

	@Override
	public ArrayList<ChatRoomVO> getChatRoomByUserList(String me_id, Criteria cri) {
		if(me_id == null) 
			return null;
		if(cri == null) {
			cri = new Criteria();
		}
		return chatDao.selectChatRoomByUserList(me_id, cri);
	}

	@Override
	public void updateChatRoomStateById(int num, String me_id) {
		chatDao.updateChatRoomStateById(num, me_id);
		return;
	}

	@Override
	public ArrayList<ChatStateVO> getChatState(int num) {
		return chatDao.selectChatRoomState(num);
	}

	@Override
	public void deleteChatRoomAndStateByNum(int num) {
		chatDao.deleteChatRoomByNum(num);
		chatDao.deleteChatStateByNum(num);
		chatDao.deleteChatMessageByNum(num);
		return;
	}

	@Override
	public int getChatRoomTotalCount(String me_id, Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		if(me_id == null) 
			return 0;
		return chatDao.selectChatRoomTotalCount(me_id, cri);
	}

	@Override
	public int getTotalMsgCount(int cm_cr_num) {
		return chatDao.selectTotalMsgCount(cm_cr_num);
	}

	@Override
	public ArrayList<ChatRoomVO> getChatRoomIds(int pNum) {
		return chatDao.selectChatRoomIds(pNum); 
  }
  
  @Override
	public ChatMessageVO getChatMessageRecent(int cm_cr_num) {
		return chatDao.selectChatMessageRecent(cm_cr_num);
	}
  
}