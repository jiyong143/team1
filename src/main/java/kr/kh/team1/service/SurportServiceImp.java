package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.SurportDAO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.SurportManageVO;
import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.pagination.Criteria;

@Service
public class SurportServiceImp implements SurportService{

	@Autowired
	SurportDAO surportDao;
	
	@Override
	public ArrayList<SurportVO> getSurportList(Criteria cri) {
		// TODO Auto-generated method stub
		return surportDao.selectSurportList(cri);
	}

	@Override
	public int getSurportTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return surportDao.selectSurportTotalCount(cri);
	}

	@Override
	public ArrayList<SurportManageVO> getSurportManageList() {
		// TODO Auto-generated method stub
		return surportDao.selectSurportManageList();
	}

	@Override
	public boolean insertSurport(SurportVO surport, MemberVO user) {
		// TODO Auto-generated method stub
		if( surport == null || 
				surport.getSu_title() == null || 
						surport.getSu_content() == null) {
				return false;
			}
			if(user == null)
				return false;
			surport.setSu_me_id(user.getMe_id());
			return surportDao.insertSurport(surport);
	}

	@Override
	public void updateView(int num) {
		surportDao.updateView(num);
		
	}
	



}
