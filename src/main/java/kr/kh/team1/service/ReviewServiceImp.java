package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.ReviewDAO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReviewTypeVO;

@Service
public class ReviewServiceImp implements ReviewService {
	
	@Autowired
	ReviewDAO reviewDao;
	
	private boolean checkString(String str) {
		return str != null && str.length() != 0; 
	}
	
	@Override
	public int getTradeReviewNum(String me_id) {
		if(!checkString(me_id)) {
			return -1;
		}
		return reviewDao.selectTradeReviewNum(me_id);
	}
	
	@Override
	public ArrayList<ProductVO> getReviewProList(String userId) {
		if(!checkString(userId)) {
			return null;
		}
			
		return reviewDao.selectReviewProList(userId);
	}

	@Override
	public ArrayList<ReviewTypeVO> getReviewType() {
		return reviewDao.selectReviewType();
	}
}
