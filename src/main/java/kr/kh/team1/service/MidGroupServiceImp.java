package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.MidGroupDAO;
import kr.kh.team1.model.vo.MidGroupVO;

@Service
public class MidGroupServiceImp implements MidGroupService {
	
    @Autowired
	MidGroupDAO midGroupDao;

	@Override
	public ArrayList<MidGroupVO> getMidGroupList() {
		return midGroupDao.selectMidGroupList(); 
	}


}
