package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.SurportDAO;
import kr.kh.team1.model.vo.SurportVO;

@Service
public class SuportServiceImp implements SuportService{
	
	@Autowired
	private SurportDAO surportDao;

	@Override
	public ArrayList<SurportVO> getSurportList() {
		//공지사항 QnA 고객센터 
		return surportDao.selectSurportList();
	}

}
