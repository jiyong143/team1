package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.SurportManageVO;
import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.pagination.Criteria_supot;

public interface SurportService {
	
	ArrayList<SurportVO> getSurportList(Criteria_supot cris);
	
	int getSurportTotalCount(Criteria_supot cris);
	
	ArrayList<SurportManageVO> getSurportManageList();
	
	boolean insertSurport(SurportVO surport, MemberVO user);

	void updateView(int suNum);
	
	SurportVO getSurport(int suNum);

	boolean updateSurport(SurportVO surport, MemberVO user);



}
