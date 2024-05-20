package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReportVO;
import kr.kh.team1.pagination.Criteria_report;

public interface ReportService {
	//거래글 리스트에서 하나의 거래글만 가져옴

	int getReportTotalCount(Criteria_report crir);

	ArrayList<ProductVO> getProductList();

	ProductVO getRePrNum(int rePrNum);
	
	ReportVO getReport(int reNum);
	
	boolean insertReportByIBH(ReportVO report, int cr_num);

	boolean insertReportProd(ReportVO report, MemberVO user);

	ArrayList<ReportVO> getReportList(String me_id, Criteria_report crir);

	boolean updateReState(int re_pr_num, String re_state, String me_state);

}
