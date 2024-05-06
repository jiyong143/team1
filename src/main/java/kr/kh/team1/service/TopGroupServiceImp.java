package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.TopGroupDAO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.model.vo.ZipcodeVO;

@Service
public class TopGroupServiceImp implements TopGroupService {
	
   @Autowired
	TopGroupDAO  topGroupDao;

	@Override
	public ArrayList<TopGroupVO> getTopGroupList() {
		return topGroupDao.selectTopGroupList(); 
	}

	@Override
	public ArrayList<MidGroupVO> getMidGroupListByTopGroup(String tg_title) {
		if(tg_title.isEmpty() || tg_title.isBlank())
			return null;
		return topGroupDao.selectMidGroupListByTopGroup(tg_title);
	}

	@Override
	public ArrayList<ZipcodeVO> getSidoList() {
		return topGroupDao.selectSidoList();
	}

	@Override
	public ArrayList<ZipcodeVO> getSigunguList(String sido) {
		if(sido.isEmpty() || sido.isBlank())
			return null;
		return topGroupDao.selectSigunguList(sido);
	}

	@Override
	public ArrayList<ZipcodeVO> getDongList(String sido, String sigungu) {
		if(sido.isEmpty() || sido.isBlank() || sigungu.isEmpty() || sigungu.isBlank())
			return null;
		return topGroupDao.selectdongList(sido, sigungu);
	}

	@Override
	public boolean insertTopGroup(String topGroup) {
		if(topGroup.isEmpty() || topGroup.isBlank())
			return false;
		return topGroupDao.insertTopGroup(topGroup);
	}

}