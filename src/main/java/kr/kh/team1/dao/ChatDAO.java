package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.ChatRoomVO;

public interface ChatDAO {

	ChatRoomVO selectChatRoom(@Param("user")String user, @Param("pr_num")int pr_num);

	boolean insertChatRoom(@Param("me_id")String me_id, @Param("pr_num")int pr_num);

	ArrayList<ChatRoomVO> selectChatRoomList(@Param("me_id")String me_id);

}