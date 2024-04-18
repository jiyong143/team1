package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.SurportManageVO;
import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.model.vo.UpHeadVO;
import kr.kh.team1.pagination.Criteria_supot;

public interface SurportService {
	
	ArrayList<SurportVO> getSurportList(Criteria_supot cris);
	
	int getSurportTotalCount(Criteria_supot cris);
	//고객지원 타입 불러오기
	ArrayList<SurportManageVO> getSurportManageList();
	//말머리 불러오기
	//ArrayList<UpHeadVO> getUpHeadList();
	
	boolean insertSurport(SurportVO surport, MemberVO user);

	void updateView(int suNum);
	
	SurportVO getSurport(int suNum);

	boolean updateSurport(SurportVO surport, MemberVO user);




}
