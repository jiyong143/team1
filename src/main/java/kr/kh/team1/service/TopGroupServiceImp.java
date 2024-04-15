package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.TopGroupDAO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.TopGroupVO;

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

}