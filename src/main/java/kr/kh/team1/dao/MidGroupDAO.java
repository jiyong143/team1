package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.MidGroupVO;

public interface MidGroupDAO { 


	ArrayList<MidGroupVO> selectMidGroupList();


}
