package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReviewTypeVO;

public interface ReviewDAO {
	ArrayList<ProductVO> selectReviewProList(@Param("id")String userId);
	
	int selectTradeReviewNum(@Param("me_id")String me_id);
	
	ArrayList<ReviewTypeVO> selectReviewType();
	
}
