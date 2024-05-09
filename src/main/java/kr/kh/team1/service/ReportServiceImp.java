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
	public ArrayList<ReportVO> getReportList(Criteria_report crir) {
		if(crir == null)
			crir = new Criteria_report();		
		return reportDao.selectReportList(crir);
	}

	@Override
	public int getReportTotalCount(Criteria_report crir) {
		return reportDao.selectReportTotalCount(crir);
	}
	//신고 리스트 출력 완료
	//신고글 작성 
	@Override
	public ArrayList<ProductVO> getProductList() {
		return reportDao.selectProductList();
	}
	
	@Override
	public boolean insertReportProduct(ReportVO report, MemberVO user) {
	  if(report.getRe_me_id() == null || 
	     report.getRe_name() == null || 
		 report.getRe_content() == null) // getRe_content() == null 조건 추가
		  return false;
	  
	  if(user == null)
		  return false;
	System.out.println(report);
    return reportDao.insertReportProd(report);
	}

	
	@Override
	public boolean insertReportByIBH(ReportVO report) {
		
		if(report.getRe_me_id() == null || report.getRe_me_id().isBlank() ||
			report.getRe_name() == null || report.getRe_name().isBlank() ||
			report.getRe_content() == null || report.getRe_content().isBlank())
			return false;
		System.out.println("1");
		return reportDao.insertReportByIBH(report);

	}

	@Override
	public ProductVO getRePrNum(int rePrNum) {
		return reportDao.selectRePrNum(rePrNum);
	}



}
