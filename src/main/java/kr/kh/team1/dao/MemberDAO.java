package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.pagination.Criteria_member;

public interface MemberDAO {

	void insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("me_id")String me_id);

	MemberVO selectMemberEmail(@Param("email")String email);

	MemberVO selectMemberPhone(@Param("phone")String phone);

	MemberVO selectMember1(@Param("string")String string);

	int selectUserTradeNum(@Param("me_id")String me_id);

	int selectReviewNum(@Param("me_id")String me_id);
	
	void updatePoint(@Param("paymentPrice")int paymentPrice, @Param("userId")String userId);

	//관리자 -> 회원관리에 필요한 코드 
	ArrayList<MemberVO> selectMemberList(Criteria_member crim);

	int selectTotalCountMember(@Param("crim") Criteria_member crim);

	boolean updateAuthority(@Param("me_id") String me_id, @Param("me_authority") String me_authority);

	
}



