package kr.kh.team1.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.ChatDAO;
import kr.kh.team1.model.dto.MessageDTO;
import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.ChatStateVO;
import kr.kh.team1.model.vo.FileVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReportVO;
import kr.kh.team1.pagination.Criteria;
import kr.kh.team1.utils.UploadFileUtils;

@Service
public class ChatServiceImp implements ChatService {

	@Autowired
	ChatDAO chatDao;
	
	@Resource
	private String uploadPath;

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

	@Override
	public ArrayList<ReportVO> getReportByProduct(int pr_num) {
		return chatDao.selectReportByProduct(pr_num);
	}

	@Override
	public ArrayList<ReportVO> getReportByChat(int pr_num) {
		return chatDao.selectReportByChat(pr_num);
	}

	@Override
	public void updateProduct(int pr_num) {
		chatDao.updateProductState(pr_num);
	}

	@Override
	public boolean deleteProduct(int pr_num) {
		ProductVO product = chatDao.selectProductByNum(pr_num);
		
		if(product == null) {
			return false;
		}
			
		// 맞으면 삭제 후 결과를 리턴
		// 서버에 첨부파일 삭제 및 DB에서 제거 => 게시글 번호에 맞는 첨부파일 리스트를 가져옴
		ArrayList<FileVO> fileList = chatDao.selectFileListByNum(pr_num); 
		
		// 첨부파일 리스트가 있으면 반복문으로 첨부파일을 삭제
		if(fileList != null) {
			for(FileVO file : fileList) {
				deleteFile(file);
			}
		}
		// 게시글 삭제
		return chatDao.deleteProduct(pr_num);
	}
	
	// 게시글 수정에서도 사용하기 위해 따로 메서드 생성
	private void deleteFile(FileVO file) {
		if(file == null) {
			return;
		}
		// 서버에서 삭제
		// 서버 경로, 첨부파일 이름
		UploadFileUtils.deleteFile(uploadPath, file.getFi_name());
		// DB에서 삭제
		chatDao.deleteFile(file.getFi_num());
	}
}