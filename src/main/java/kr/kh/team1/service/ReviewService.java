package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReviewTypeVO;

public interface ReviewService {
	
	int getTradeReviewNum(String me_id);
	
	ArrayList<ProductVO> getReviewProList(String userId);

	ArrayList<ReviewTypeVO> getReviewType();
}
