package kr.kh.team1.dao;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;

public interface ProductDAO { 

	ArrayList<ProductVO> selectProductList(@Param("num")int mNum, @Param("cri")Criteria cri); 

	int selectProductTotalCount(@Param("num")int mNum, @Param("cri")Criteria cri);
	
	

}
