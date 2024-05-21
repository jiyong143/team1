package kr.kh.team1.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.mysql.cj.Session;

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

	@Override
	public boolean fixedDelete(int fixNum, MemberVO user) {
	    // 사용자가 null이면 삭제를 수행할 수 없으므로 false를 반환합니다.
	    if (user == null) {
	        return false;
	    }

	    // 지원 요청 번호를 기준으로 해당 지원 요청 정보를 조회합니다.
	    FixedVO fixed = fixedDao.selectFixed(fixNum);
	    
	    // 조회된 지원 요청이 null이거나 현재 사용자의 요청이거나 현재 사용자가 관리자이면 삭제를 수행합니다.
	    if (fixed == null || fixed.getFix_me_id().equals(user.getMe_id()) || user.getMe_authority().equals("admin")) {
	        try {
	            // 지원 요청 삭제를 시도합니다.
	            return fixedDao.fixedDelete(fixNum);
	        } catch (Exception e) {
	            // 데이터베이스 작업 중 예외가 발생하면 예외를 적절히 처리합니다.
	            e.printStackTrace(); // 또는 로깅
	            return false;
	        }
	    } else {
	        // 삭제 권한이 없는 경우 false를 반환합니다.
	        return false;
	    }
	}



	
	


	



}
