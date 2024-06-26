package kr.kh.team1.service;

import java.util.ArrayList;
import kr.kh.team1.model.dto.LoginDTO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.PaymentVO;
import kr.kh.team1.model.vo.PickVO;
import kr.kh.team1.pagination.Criteria_member;

public interface MemberService {

	boolean signup(MemberVO member);

	MemberVO login(LoginDTO loginDto);

	boolean idCheck(String id);
	
	boolean emailCheck(String email);

	boolean phoneCheck(String phone);

	boolean birthCheck(String birth);

	MemberVO getMemberDate();

	MemberVO getMember(String me_id);

	void addPoint(int paymentPrice, String userId);

	boolean updateMember(MemberVO member);

	void deleteMember(String me_id);

	boolean idCheck(String sns, String email);

	int getTradeNum(String me_id);

	int getReviewNum(String me_id);
	
	MemberVO getMemberById(MemberVO user);

	//관리자 -> 회원관리에 필요한 코드 START
	
	ArrayList<MemberVO> getMemberList(Criteria_member crim);
	
	int getTotalCountMember(Criteria_member crim);

	boolean updateAuthority(String me_id, String me_authority, String me_state);

	boolean addReportCount(MemberVO user, int meReportCount);

	int getMannerScore(String me_id);

	ArrayList<PaymentVO> getPaymentList(String myUser);

	int getPoint(String userId);

	void payment(String pr_me_id, String myUser, int pr_price);

	int getPickNum(String me_id);

	ArrayList<PickVO> getPickList(String me_id);

	void deletePick(int pi_num);

	//관리자 -> 회원관리에 필요한 코드 END 

//	boolean signupSns(String sns, String id, String email);
//
//	MemberVO loginSns(String sns, String id);

}
