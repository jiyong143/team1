package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.model.vo.ZipcodeVO;

public interface TopGroupService {

	ArrayList<TopGroupVO> getTopGroupList();

	ArrayList<MidGroupVO> getMidGroupListByTopGroup(String tg_title);

	ArrayList<ZipcodeVO> getSidoList();

	ArrayList<ZipcodeVO> getSigunguList(String sido);

	ArrayList<ZipcodeVO> getDongList(String sido, String sigungu);

	boolean insertTopGroup(String topGroup);
}