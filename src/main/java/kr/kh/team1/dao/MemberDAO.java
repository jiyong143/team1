package kr.kh.team1.dao;

public interface MemberDAO {

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.MemberVO;

public interface MemberDAO {

	void insertMember(@Param("member")MemberVO member);

	MemberVO selectMember(@Param("me_id")String me_id);

}
