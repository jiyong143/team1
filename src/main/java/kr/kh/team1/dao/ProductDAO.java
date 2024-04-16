package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.FileVO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;

public interface ProductDAO { 

	ArrayList<ProductVO> selectProductList(@Param("num")int mNum, @Param("cri")Criteria cri); 

	int selectProductTotalCount(@Param("num")int mNum, @Param("cri")Criteria cri);

	ArrayList<ProductVO> selectProductAllList(@Param("num")int mNum, @Param("cri")Criteria cri);

	int selectMaxPrice(@Param("num")int mNum, @Param("cri")Criteria cri);

	int selectMinPrice(@Param("num")int mNum, @Param("cri")Criteria cri);

	int selectAvgPrice(@Param("num")int mNum, @Param("cri")Criteria cri);
	
	ArrayList<ProductVO> selectMypagePro(@Param("me_id")String me_id, @Param("clickData")String clickData);

	void insertFile(@Param("file")FileVO fileVo);

	boolean insertProduct(@Param("product")ProductVO product);

	MidGroupVO selectMidGroup(@Param("mg")String mg_title);
}

