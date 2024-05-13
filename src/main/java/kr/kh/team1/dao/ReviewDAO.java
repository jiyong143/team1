package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReviewTypeVO;
import kr.kh.team1.model.vo.TradeOutcomeVO;

public interface ReviewDAO {
	
	int selectTradeReviewNum(@Param("me_id")String me_id);
	
	ArrayList<ReviewTypeVO> selectReviewType();

	void insertReview(@Param("reviewType")ArrayList<String> reviewType, @Param("trNum")int trNum);
	
	void insertReview2(@Param("reviewType")ArrayList<String> reviewType, @Param("trNum")int trNum);

	int selectTrNum(@Param("prNum")int prNum);

	ArrayList<ReviewTypeVO> selectReviewList();

	ArrayList<TradeOutcomeVO> selectMyReviewList0(@Param("me_id")String me_id); //판매자일 때 구매자에게 받은 후기
	
	ArrayList<TradeOutcomeVO> selectMyReviewList1(@Param("me_id")String me_id); //구매자일 때 판매자에게 받은 후기

	ArrayList<Integer> selectTrNumByUserId(@Param("userId")String userId);

	int selectCountTradeOutcome(@Param("i")int i);

	ProductVO selectReviewProList(@Param("i")int i);

	ArrayList<Integer> selectTrNumByUserIdSeller(@Param("userId")String userId);

	int selectCountTradeOutcome2(@Param("i")int i);

	String checkTradeReview(@Param("trNum")int trNum);

	void insertReviewDefault1(@Param("reviewDeleteVal")int reviewDeleteVal);
	
	void insertReviewDefault2(@Param("reviewDeleteVal")int reviewDeleteVal);

	
}
