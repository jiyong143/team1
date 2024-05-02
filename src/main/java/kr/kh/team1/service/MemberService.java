package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.dto.LoginDTO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.pagination.Criteria_member;
import kr.kh.team1.model.vo.ProductVO;

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

	//관리자 -> 회원관리에 필요한 코드 
	
	ArrayList<MemberVO> getMemberList(Criteria_member crim);
	
	int getTotalCountMember(Criteria_member crim);

	boolean updateAuthority(String me_id, String me_authority, String me_state);

//	boolean signupSns(String sns, String id, String email);
//
//	MemberVO loginSns(String sns, String id);

}
