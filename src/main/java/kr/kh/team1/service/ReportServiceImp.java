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

	@Override
	public boolean insertReportProduct(ReportVO report, ProductVO product, MemberVO user) {
		if(user == null || report == null || product == null) {
			return false;
		}
		if( !checkString(report.getRe_name()) ||
			//!checkString(report.getRe_pr_num()) ||
			!checkString(report.getRe_content())) {
			return false;
		}
		return false;
	}

	private boolean checkString(String re_content) {
		// TODO Auto-generated method stub
		return false;
	}

}
