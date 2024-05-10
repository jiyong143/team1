package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReviewTypeVO;
import kr.kh.team1.model.vo.TradeOutcomeVO;

public interface ReviewService {
	
	int getTradeReviewNum(String me_id);
	
	ArrayList<ProductVO> getReviewProList(String userId);

	ArrayList<ReviewTypeVO> getReviewType();

	int getTrNum(int prNum);

	boolean addReview(ArrayList<String> reviewType, int trNum);

	ArrayList<ReviewTypeVO> getReviewList();

	ArrayList<TradeOutcomeVO> getMyReviewList0(String me_id);
	
	ArrayList<TradeOutcomeVO> getMyReviewList1(String me_id);
}
