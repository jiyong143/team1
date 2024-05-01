package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReportVO;
import kr.kh.team1.pagination.Criteria_report;

public interface ReportService {

	ArrayList<ReportVO> getReportList(Criteria_report crir);

	int getReportTotalCount(Criteria_report crir);

	boolean insertReport(ReportVO report, ProductVO product, MemberVO user);

}
