package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.dto.MessageDTO;
import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.ChatRoomVO;

public interface ChatDAO {

	ChatRoomVO selectChatRoom(@Param("me_id")String me_id, @Param("pr_num")int pr_num);

	void insertChatRoom(@Param("me_id")String me_id, @Param("pr_num")int pr_num);

	ArrayList<ChatRoomVO> selectChatRoomList(@Param("me_id")String me_id);

	boolean insertChat(@Param("msg")MessageDTO message);

	ArrayList<ChatMessageVO> selectChatMessgeList(@Param("cr_num")int cr_num);

	void insertChatRoomState(@Param("me_id")String me_id, @Param("pr_num")int pr_num);
}