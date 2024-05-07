package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.model.vo.ZipcodeVO;

public interface TopGroupDAO {

	ArrayList<TopGroupVO> selectTopGroupList();

	ArrayList<MidGroupVO> selectMidGroupListByTopGroup(@Param("title")String tg_title);

	ArrayList<ZipcodeVO> selectSidoList();

	ArrayList<ZipcodeVO> selectSigunguList(@Param("sido")String sido);

	ArrayList<ZipcodeVO> selectdongList(@Param("sido")String sido, @Param("sigungu")String sigungu);

	boolean insertTopGroup(@Param("topGroup")String topGroup);

	boolean deleteTopGroup(@Param("tg_num")int tg_num);

	boolean updateTopGroup(@Param("tg_num")int tg_num, @Param("topGroup")String topGroup);
}