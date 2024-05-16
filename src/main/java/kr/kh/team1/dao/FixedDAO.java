package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.FixedVO;
import kr.kh.team1.pagination.Criteria_supot;

public interface FixedDAO {

	ArrayList<FixedVO> selectFixList(@Param("cris") Criteria_supot cris);

	int selectFixTotalCount(@Param("cris") Criteria_supot cris);

	boolean insertFixPost(@Param("fixed") FixedVO fixed);

	void fixUpdateView(@Param("fix_num") int fixNum);

	FixedVO selectFixed(@Param("fix_num") int fixNum);

	boolean fixedDelete(@Param("fix_num") int fixNum);	

}
