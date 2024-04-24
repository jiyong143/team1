package kr.kh.team1.dao;

import org.apache.ibatis.annotations.Param;
import kr.kh.team1.model.vo.MemberVO;

public interface MemberDAO {

	void insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("me_id")String me_id);

	MemberVO selectMemberEmail(@Param("email")String email);

	MemberVO selectMemberPhone(@Param("phone")String phone);

	MemberVO selectMember1(@Param("string")String string);

	int selectUserTradeNum(@Param("me_id")String me_id);

	int selectReviewNum(@Param("me_id")String me_id);
	
	void updatePoint(@Param("paymentPrice")int paymentPrice, @Param("userId")String userId);

	void updateMember(@Param("member")MemberVO member);

	void updateMemberState(@Param("me_id")String me_id);
	
}



