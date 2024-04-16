package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.TopGroupVO;

public interface TopGroupDAO {

	ArrayList<TopGroupVO> selectTopGroupList();

	ArrayList<MidGroupVO> selectMidGroupListByTopGroup(@Param("title")String tg_title);
}