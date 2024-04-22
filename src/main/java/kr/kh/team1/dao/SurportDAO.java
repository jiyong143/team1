package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.SurportManageVO;
import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.model.vo.UpHeadVO;
import kr.kh.team1.pagination.Criteria_supot;

public interface SurportDAO {

	ArrayList<SurportVO> selectSurportList(@Param("cris") Criteria_supot cris);

	int selectSurportTotalCount(@Param("cris") Criteria_supot cris);

	ArrayList<SurportManageVO> selectSurportManageList();

	ArrayList<UpHeadVO> selectUpHeadList();
	
	boolean insertSurport(@Param("surport") SurportVO surport);

	void updateView(@Param("su_num") int suNum);

	SurportVO selectSurport(@Param("su_num") int suNum);

	//void updateSurport(@Param("surport") SurportVO surport);
	
	boolean updateSurport(@Param("surport") SurportVO surport);

	//SurportManageVO selectSurportManage(@Param("su_num") int suNum);


	

}
