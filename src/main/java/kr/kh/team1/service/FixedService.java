package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.FixedVO;
import kr.kh.team1.model.vo.MemberVO;

import kr.kh.team1.pagination.Criteria_supot;

public interface FixedService {

	ArrayList<FixedVO> getFixList(Criteria_supot cris);

	int getFixTotalCount(Criteria_supot cris);

	boolean insertFixPost(FixedVO fixed, MemberVO user);

	void fixUpdateView(int fixNum);

	FixedVO getFixed(int fixNum);

	boolean fixedDelete(int fixNum, MemberVO user);






}
