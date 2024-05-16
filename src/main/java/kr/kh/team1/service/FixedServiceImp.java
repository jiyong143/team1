package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.FixedDAO;
import kr.kh.team1.model.vo.FixedVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.pagination.Criteria_supot;

@Service
public class FixedServiceImp implements FixedService{

	@Autowired
	FixedDAO fixedDao;

	@Override
	public ArrayList<FixedVO> getFixList(Criteria_supot cris) {
		if(cris == null)
			cris = new Criteria_supot();
		return fixedDao.selectFixList(cris);
	}

	@Override
	public int getFixTotalCount(Criteria_supot cris) {
		return fixedDao.selectFixTotalCount(cris);
	}

	@Override
	public boolean insertFixPost(FixedVO fixed, MemberVO user) {
		    if (fixed == null || fixed.getFix_title() == null || fixed.getFix_content() == null || user == null || user.getMe_id() == null) {
		        return false;
		    }
		    
		    fixed.setFix_me_id(user.getMe_id());		    
		    try {
		        return fixedDao.insertFixPost(fixed);
		    } catch (Exception e) {
		        // 예외 처리
		        e.printStackTrace(); // 또는 로깅
		        return false;
		    }
		}


	@Override
	public void fixUpdateView(int fixNum) {
		fixedDao.fixUpdateView(fixNum);
		
	}

	@Override
	public FixedVO getFixed(int fixNum) {
		return fixedDao.selectFixed(fixNum);
	}
	


	
	


	



}
