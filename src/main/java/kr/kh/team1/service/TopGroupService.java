package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.TopGroupVO;

public interface TopGroupService {

	ArrayList<TopGroupVO> getTopGroupList();

	ArrayList<MidGroupVO> getMidGroupListByTopGroup(String tg_title);
}