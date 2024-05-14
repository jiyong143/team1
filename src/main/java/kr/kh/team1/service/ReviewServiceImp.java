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
		ArrayList<ProductVO> proList = new ArrayList<ProductVO>();
		//구매자
		ArrayList<Integer> trNumBuyer = reviewDao.selectTrNumByUserId(userId); //구매자 입장에서 만들어진 후기테이블의 번호 (tr_num)
		ArrayList<Integer> trNumBuyer2 = new ArrayList<Integer>(); //위의 리스트에서 trade_outcome의 개수가 0인 tr_num
		for(int i:trNumBuyer) {
			if(reviewDao.selectCountTradeOutcome(i)==0) { //0이 아니라는 뜻은 이미 후기가 작성되었다는 것 
				trNumBuyer2.add(i); //리뷰를 작성해야 할 tr_num들만 모임
			}
		}		
		for(int i:trNumBuyer2) {
			proList.add(reviewDao.selectReviewProList(i));
		}
		//구매자
		
		//판매자
		ArrayList<Integer> trNumSeller = reviewDao.selectTrNumByUserIdSeller(userId); //판매자 입장에서 만들어진 후기테이블의 번호 tr_num
		ArrayList<Integer> trNumSeller2 = new ArrayList<Integer>();
		for(int i:trNumSeller) {
			if(reviewDao.selectCountTradeOutcome2(i)==0) { 
				trNumSeller2.add(i);
			}
		}
		for(int i:trNumSeller2) {
			proList.add(reviewDao.selectReviewProList(i));
		}
		//판매자
		
		return proList;
		
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
	public boolean addReview(ArrayList<String> reviewType, int trNum, String me_id, int mannerScore) {
		for(String i:reviewType) {
			if(!checkString(i)) {
				return false;
			}
		}
		
		if(reviewDao.checkTradeReview(trNum).equals(me_id)) {
			reviewDao.insertReview(reviewType, trNum); //구매자의 매너점수 수정
			reviewDao.updateReviewScore(trNum, mannerScore);
		} else {
			reviewDao.insertReview2(reviewType, trNum); //판매자의 매너점수 수정
			reviewDao.updateReviewScore2(trNum, mannerScore);
		}
		
		return true;
	}

	@Override
	public ArrayList<ReviewTypeVO> getReviewList() {
		
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

	@Override
	public void deleteReview(int reviewDeleteVal, String userId) {
		
		if(reviewDao.checkTradeReview(reviewDeleteVal).equals(userId)) {
			reviewDao.insertReviewDefault1(reviewDeleteVal); //구매자
		} else {
			reviewDao.insertReviewDefault2(reviewDeleteVal); //판매자
		}
		
	}

	@Override
	public int getReviewScore(String i) {
		return reviewDao.selectReviewScore(i);
	}


}
