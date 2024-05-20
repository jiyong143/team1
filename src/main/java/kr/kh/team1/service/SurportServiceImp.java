package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.SurportDAO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.SurportManageVO;
import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.model.vo.UpHeadVO;
import kr.kh.team1.pagination.Criteria_supot;

@Service
public class SurportServiceImp implements SurportService{

	@Autowired
	SurportDAO surportDao;
	
	@Override
	public ArrayList<SurportVO> getSurportList(Criteria_supot cris) {
		if(cris == null)
			cris = new Criteria_supot();
		return surportDao.selectSurportList(cris);
	}

	@Override
	public int getSurportTotalCount(Criteria_supot cris) {
		return surportDao.selectSurportTotalCount(cris);
	}

	@Override
	public ArrayList<SurportManageVO> getSurportManageList() {
		return surportDao.selectSurportManageList();
	}
	
	@Override
	public ArrayList<UpHeadVO> getUpHeadList() {
		return surportDao.selectUpHeadList();
	}
	
	@Override
	public boolean insertSurport(SurportVO surport, MemberVO user) {
		if( surport == null || 
			surport.getSu_title() == null || 
			surport.getSu_content() == null) 
				return false;
			
		if(user == null)
			return false;
		surport.setSu_me_id(user.getMe_id());
		return surportDao.insertSurport(surport);
	}

	@Override
	public void updateView(int suNum) {
		surportDao.updateView(suNum);
		
	}
	
	@Override
	public SurportVO getSurport(int suNum) {
		return surportDao.selectSurport(suNum);
	}

	@Override
	public boolean updateSurport(SurportVO surport, MemberVO user) {
		//null체크
		if( surport == null ||
			!checkString(surport.getSu_title()) ||
			!checkString(surport.getSu_content())) {
			return false;
		}
		if(user == null) {
			return false;
		}
		SurportVO dbSurport = surportDao.selectSurport(surport.getSu_num());
		if( dbSurport == null ||
			!dbSurport.getSu_me_id().equals(user.getMe_id())) {
			return false;
		}
		surportDao.updateSurport(surport);
		System.out.println("updateSurport");
		return true;
	}
	
	private boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}
	
	@Override
	public boolean deleteSurport(int suNum, MemberVO user) {
		if(user == null) {
			return false;
		}
		SurportVO surport = surportDao.selectSurport(suNum);
		if( surport == null ||
			!surport.getSu_me_id().equals(user.getMe_id())) {
			return false;
		}
		return surportDao.deleteSurport(suNum);
	}

}
