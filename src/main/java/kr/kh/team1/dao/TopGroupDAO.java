package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.model.vo.ZipcodeVO;
import kr.kh.team1.pagination.Criteria;

public interface TopGroupDAO {

	ArrayList<TopGroupVO> selectTopGroupList();

	ArrayList<MidGroupVO> selectMidGroupListByTopGroup(@Param("title")String tg_title);

	ArrayList<ZipcodeVO> selectSidoList();

	ArrayList<ZipcodeVO> selectSigunguList(@Param("sido")String sido);

	ArrayList<ZipcodeVO> selectdongList(@Param("sido")String sido, @Param("sigungu")String sigungu);

	ArrayList<ZipcodeVO> selectdongListBySido(@Param("sido")String sido);

	boolean insertTopGroup(@Param("topGroup")String topGroup);

	boolean deleteTopGroup(@Param("tg_num")int tg_num);

	boolean updateTopGroup(@Param("tg_num")int tg_num, @Param("topGroup")String topGroup);

	ArrayList<MidGroupVO> selectMidGroupListByNum(@Param("pr_num")int num);

	TopGroupVO selectTopGroup(@Param("num")int topNum);

	TopGroupVO selectTopGroupByName(@Param("name")String topName);

	ArrayList<TopGroupVO> selectTopGroupListByCri(@Param("cri")Criteria cri);

	int selectTopGroupTotalCount();

	ArrayList<MidGroupVO> selectMidGroupList(@Param("tg")int topGroup, @Param("cri")Criteria cri);

	TopGroupVO selectTopGroupByTitle(@Param("tg") String topGroup);

	int selectTotalMidGroupByTopCount(@Param("tg")int num, @Param("cri")Criteria cri);

	boolean insertMidGroup(@Param("topGroup")String topGroup, @Param("tg")int tg);

	boolean updateMidGroup(@Param("tg")int tg_num, @Param("topGroup")String topGroup);

	boolean deleteMidGroup(@Param("tg")int tg_num);

	MidGroupVO selectMidGroupByTitle(@Param("tg")int tg, @Param("topGroup")String topGroup);
}