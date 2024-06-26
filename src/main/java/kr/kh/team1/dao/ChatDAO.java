package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.dto.MessageDTO;
import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.ChatRoomVO;
import kr.kh.team1.model.vo.ChatStateVO;
import kr.kh.team1.model.vo.FileVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReportVO;
import kr.kh.team1.pagination.Criteria;

public interface ChatDAO {

	ChatRoomVO selectChatRoom(@Param("me_id")String me_id, @Param("pr_num")int pr_num);

	ChatRoomVO selectChatRoomByUser(@Param("me_id")String me_id, @Param("cr_num")int cr_num);

	ChatRoomVO selectChatRoomBySeller(@Param("me_id")String me_id, @Param("cr_num")int cr_num);
	
	void insertChatRoom(@Param("me_id")String me_id, @Param("pr_num")int pr_num);

	boolean insertChat(@Param("msg")MessageDTO message);

	ArrayList<ChatMessageVO> selectChatMessgeList(@Param("cr_num")int cr_num, @Param("chatCount")int chatCount);

	void insertChatRoomState(@Param("me_id")String me_id, @Param("pr_num")int pr_num);

	ArrayList<ChatRoomVO> selectChatRoomByUserList(@Param("me_id")String me_id, @Param("cri")Criteria cri);

	void updateChatRoomStateById(@Param("num")int num, @Param("me_id")String me_id);

	ArrayList<ChatStateVO> selectChatRoomState(@Param("num")int num);

	void deleteChatRoomByNum(@Param("num")int num);

	void deleteChatStateByNum(@Param("num")int num);

	void deleteChatMessageByNum(@Param("num")int num);

	int selectChatRoomTotalCount(@Param("me_id")String me_id, @Param("cri")Criteria cri);

	int selectTotalMsgCount(@Param("num")int cm_cr_num);

	ArrayList<ChatRoomVO> selectChatRoomIds(@Param("pr_num")int pNum);

	ChatMessageVO selectChatMessageRecent(@Param("num")int cm_cr_num);

	ArrayList<ReportVO> selectReportByProduct(@Param("num")int pr_num);

	ArrayList<ReportVO> selectReportByChat(@Param("num")int pr_num);
	
	void updateProductState(@Param("num")int pr_num);

	ProductVO selectProductByNum(@Param("num")int pr_num);

	ArrayList<FileVO> selectFileListByNum(@Param("num")int pr_num);

	boolean deleteProduct(@Param("num")int pr_num);

	void deleteFile(@Param("num")int fi_num);
}