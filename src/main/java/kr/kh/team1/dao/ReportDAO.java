package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReportVO;
import kr.kh.team1.pagination.Criteria_report;

public interface ReportDAO {

	ArrayList<ReportVO> selectReportList(@Param("crir") Criteria_report crir);
 
	int selectReportTotalCount(@Param("crir") Criteria_report crir);

	boolean insertReportByIBH(@Param("report") ReportVO report);


}
