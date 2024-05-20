package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.ReportDAO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReportVO;
import kr.kh.team1.pagination.Criteria_report;

@Service
public class ReportServiceImp implements ReportService{
	
	@Autowired
	ReportDAO reportDao;
	//신고 리스트 출력
	@Override
	public ArrayList<ReportVO> getReportList(String me_id, Criteria_report crir) {
		if(crir == null)
			crir = new Criteria_report();		
		return reportDao.selectReportList(me_id, crir);
	}
	

	

	@Override
	public int getReportTotalCount(Criteria_report crir) {
		return reportDao.selectReportTotalCount(crir);
	}
	
	//신고글 작성 
	@Override
	public ArrayList<ProductVO> getProductList() {
		//거래글 리스트에서 하나의 거래글만 가져옴
		return reportDao.selectProductList();
	}
	
	@Override
	public boolean insertReportProd(ReportVO report, MemberVO user) {
	  if(report.getRe_me_id() == null || //신고 신청자, 예외처리 
	     report.getRe_name() == null ||  //신고 유형, 예외처리
		 report.getRe_content() == null) //신고 내용, 예외처리
		  return false;
	  
	  if(user == null)
		  return false;
	System.out.println(report);
    return reportDao.insertReportProd(report);
	}
	
	@Override
	public ProductVO getRePrNum(int rePrNum) {
		return reportDao.selectRePrNum(rePrNum);
	}

	@Override
	public ReportVO getReport(int reNum) {
		return reportDao.selectReport(reNum);
	}
	
	@Override
	public boolean insertReportByIBH(ReportVO report, int cr_num) {
		
		if(report.getRe_me_id() == null || report.getRe_me_id().isBlank() ||
		   report.getRe_name() == null || report.getRe_name().isBlank() ||
		   report.getRe_content() == null || report.getRe_content().isBlank())
		   return false;
		return reportDao.insertReportByIBH(report, cr_num);
	}
	
	@Override
	public boolean updateState(int re_pr_num) {
	    if (re_pr_num <= 0) {
	        return false;
	    }
	    return reportDao.updateState(re_pr_num);
	}


	
}
