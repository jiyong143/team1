package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.dto.MessageDTO;
import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.ChatRoomVO;

public interface ChatDAO {

	ChatRoomVO selectChatRoom(@Param("me_id")String me_id, @Param("pr_num")int pr_num);

	ChatRoomVO selectChatRoomByUser(@Param("me_id")String me_id, @Param("cr_num")int cr_num);

	ChatRoomVO selectChatRoomBySeller(@Param("me_id")String me_id, @Param("cr_num")int cr_num);
	
	void insertChatRoom(@Param("me_id")String me_id, @Param("pr_num")int pr_num);

	boolean insertChat(@Param("msg")MessageDTO message);

	ArrayList<ChatMessageVO> selectChatMessgeList(@Param("cr_num")int cr_num);

	void insertChatRoomState(@Param("me_id")String me_id, @Param("pr_num")int pr_num);

	ArrayList<ChatRoomVO> selectChatRoomByUserList(@Param("me_id")String me_id);

	ArrayList<ChatRoomVO> selectChatRoomBySellerList(@Param("me_id")String me_id);
}