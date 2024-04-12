package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.SurportManageVO;
import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.pagination.Criteria;

public interface SurportDAO {

	ArrayList<SurportVO> selectSurportList(@Param("cri") Criteria cri);

	int selectSurportTotalCount(@Param("cri") Criteria cri);

	ArrayList<SurportManageVO> selectSurportManageList();

	boolean insertSurport(@Param("surport") SurportVO surport);

	Object updateView(@Param("num") int num);


	
	

}
