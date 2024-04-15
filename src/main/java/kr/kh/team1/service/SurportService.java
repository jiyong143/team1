package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.SurportManageVO;
import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.pagination.Criteria;

public interface SurportService {

	ArrayList<SurportVO> getSurportList(Criteria cri);

	int getSurportTotalCount(Criteria cri);

	ArrayList<SurportManageVO> getSurportManageList();

	boolean insertSurport(SurportVO surport, MemberVO user);

	void updateView(int num);
}