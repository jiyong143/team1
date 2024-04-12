package kr.kh.team1.dao;

import java.util.ArrayList;

import kr.kh.team1.model.vo.TopGroupVO;

public interface TopGroupDAO {

	ArrayList<TopGroupVO> selectTopGroupList();

}