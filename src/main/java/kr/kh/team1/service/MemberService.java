package kr.kh.team1.service;

import kr.kh.team1.model.dto.LoginDTO;
import kr.kh.team1.model.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO member);

	MemberVO login(LoginDTO loginDto);

	boolean idCheck(String id);
	
	boolean emailCheck(String email);

	boolean phoneCheck(String phone);

	boolean birthCheck(String birth);

	MemberVO getMemberDate();

	int getTradeNum(String me_id);

	int getReviewNum(String me_id);

	MemberVO getMember(String me_id);

	void addPoint(int paymentPrice, String userId);

	boolean updateMember(MemberVO member);

	void deleteMember(String me_id);

	boolean idCheck(String sns, String email);

//	boolean signupSns(String sns, String id, String email);
//
//	MemberVO loginSns(String sns, String id);
}
