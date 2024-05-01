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
		// TODO Auto-generated method stub
		return reportDao.selectReportTotalCount(crir);
	}

	@Override
	public boolean insertReport(ReportVO report, ProductVO product, MemberVO user) {
		// TODO Auto-generated method stub
		return false;
	}

}
