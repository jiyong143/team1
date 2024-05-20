package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReportVO;
import kr.kh.team1.pagination.Criteria_report;

public interface ReportDAO {
	
	ArrayList<ReportVO> selectReportList(@Param("me_id") String me_id, @Param("crir") Criteria_report crir);
 
	int selectReportTotalCount(@Param("crir") Criteria_report crir);
	
	//거래글 리스트에서 하나의 거래글만 가져옴
	ArrayList<ProductVO> selectProductList();

	boolean insertReportProd(@Param("report") ReportVO report);

	ProductVO selectRePrNum(@Param("re_pr_num") int rePrNum);
	
	ReportVO selectReport(@Param("re_num") int reNum);

	boolean insertReportByIBH(@Param("report") ReportVO report, @Param("cr_num") int cr_num);

	boolean updateState(@Param("re_pr_num") int re_pr_num);

}
