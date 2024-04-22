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
	
	//고객센터 리스트 SRART
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
	//고객센터 리스트 END
	//고객센터 작성 SRART
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
	//고객센터 작성 END
	//고객센터 상세 START
	@Override
	public void updateView(int suNum) {
		surportDao.updateView(suNum);
		
	}
	
	@Override
	public SurportVO getSurport(int suNum) {
		return surportDao.selectSurport(suNum);
	}
	/*
	@Override
	public SurportManageVO getSurportManage(int suNum) {
		return surportDao.selectSurportManage(suNum);
	}
	*/
	//고객센터 상세 END
	//고객센터 수정 START
	/*
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
		//작성자 확인
		SurportVO dbSurport = surportDao.selectSurport(surport.getSu_num());
		if( dbSurport == null ||
			!dbSurport.getSu_me_id().equals(user.getMe_id())) {
			return false;
		}
		//글 수정
		surportDao.updateSurport(surport);
		System.out.println("updateSurport");
		return true;
	}
	*/
	@Override
	public boolean updateSurport(SurportVO surport, MemberVO user) {
	    // null 체크
	    if (surport == null || 
    		!checkString(surport.getSu_title()) || 
    		!checkString(surport.getSu_content()) || 
    		user == null) {
	        return false;
	    }
	    
	    // 작성자 확인
	    SurportVO dbSurport = surportDao.selectSurport(surport.getSu_num());
	    if (dbSurport == null || 
    		!dbSurport.getSu_me_id().equals(user.getMe_id())) {
	        return false;
	    }	    
	    // 글 수정 
	    boolean success = surportDao.updateSurport(surport);
	    if (success) {
	        System.out.println("updateSurport");
	    } else {
	        System.out.println("Failed to update Surport");
	    }
	    return success;
	}

	
	
	
	

	private boolean checkString(String str) {
		//문자열 null 체크
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	
	


	



}
