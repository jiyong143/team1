package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.PaymentVO;
import kr.kh.team1.model.vo.PickVO;
import kr.kh.team1.pagination.Criteria_member;

public interface MemberDAO {

	void insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("me_id")String me_id);

	MemberVO selectMemberEmail(@Param("email")String email);

	MemberVO selectMemberPhone(@Param("phone")String phone);

	MemberVO selectMember1(@Param("string")String string);

	int selectUserTradeNum(@Param("me_id")String me_id);
	
	void updatePoint(@Param("paymentPrice")int paymentPrice, @Param("userId")String userId);

	//관리자 -> 회원관리에 필요한 코드 START
	ArrayList<MemberVO> selectMemberList(Criteria_member crim);

	int selectTotalCountMember(@Param("crim") Criteria_member crim);

	boolean updateAuthority(@Param("me_id") String me_id, @Param("me_authority") String me_authority, @Param("me_state") String me_state);
	
	boolean updateReportCount(@Param("me_report_count") int meReportCount);
	
	MemberVO getMemberById(@Param("me_id") MemberVO user);
	//관리자 -> 회원관리에 필요한 코드 END
	
	void updateMemberState(@Param("me_id") String me_id);
	
	void updateMember(@Param("member")MemberVO member);

	int selectReviewNumSeller(@Param("me_id")String me_id);

	int selectReviewNumBuyer(@Param("me_id")String me_id);

	ArrayList<PaymentVO> selectPaymentList(@Param("me_id")String myUser);

	int selectPoint(@Param("me_id")String userId);

	void addPoint(@Param("me_id") String pr_me_id, @Param("price")int pr_price);

	void subtractPoint(@Param("me_id")String myUser, @Param("price")int pr_price);

	MemberVO idCheck(@Param("id")String id);

	int selectPickNum(@Param("me_id")String me_id);

	ArrayList<PickVO> selectPickList(@Param("me_id")String me_id);

	void deletePick(@Param("pi_num")int pi_num);

	


	
}



