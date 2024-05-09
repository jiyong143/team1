package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mysql.cj.util.TestUtils;

import kr.kh.team1.dao.ReviewDAO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReviewTypeVO;
import kr.kh.team1.model.vo.TradeOutcomeVO;

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

	@Override
	public int getTrNum(int prNum) {
		return reviewDao.selectTrNum(prNum); 
	}

	@Override
	public boolean addReview(ArrayList<String> reviewType, int trNum) {
		for(String i:reviewType) {
			if(!checkString(i)) {
				return false;
			}
		}
		
		reviewDao.insertReview(reviewType, trNum);
		
		return true;
	}

	@Override
	public ArrayList<String> getReviewList() {
		
		return reviewDao.selectReviewList();
	}

	@Override
	public ArrayList<TradeOutcomeVO> getMyReviewList0(String me_id) {
		if(!checkString(me_id)) {
			return null;
		}
		return reviewDao.selectMyReviewList0(me_id);
	}
	
	@Override
	public ArrayList<TradeOutcomeVO> getMyReviewList1(String me_id) {
		if(!checkString(me_id)) {
			return null;
		}
		return reviewDao.selectMyReviewList1(me_id);
	}


}
