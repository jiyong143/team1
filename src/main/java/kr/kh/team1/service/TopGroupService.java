package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.model.vo.ZipcodeVO;
import kr.kh.team1.pagination.Criteria;

public interface TopGroupService {

	ArrayList<TopGroupVO> getTopGroupList();

	ArrayList<MidGroupVO> getMidGroupListByTopGroup(String tg_title);

	ArrayList<ZipcodeVO> getSidoList();

	ArrayList<ZipcodeVO> getSigunguList(String sido);

	ArrayList<ZipcodeVO> getDongList(String sido, String sigungu);

	boolean insertTopGroup(String topGroup);

	boolean deleteTopGroup(int tg_num);

	boolean updateTopGroup(int tg_num, String topGroup);

	TopGroupVO getTopGroup(int topNum);

	TopGroupVO getTopGroupByName(String topName);

	ArrayList<TopGroupVO> getTopGroupListByCri(Criteria cri);

	int getTopGroupTotalCount();

	ArrayList<MidGroupVO> getMidGroupList(int topGroup, Criteria cri);

	TopGroupVO getTopGroupByNum(String topGroup);

	int getTotalMidGroupByTopCount(int num, Criteria cri);

	boolean insertMidGroup(String topGroup, int num);

	boolean updateMidGroup(int tg_num, String topGroup);

	boolean deleteMidGroup(int tg_num);
}