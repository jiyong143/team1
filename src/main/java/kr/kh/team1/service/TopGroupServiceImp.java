package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.TopGroupDAO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.model.vo.ZipcodeVO;
import kr.kh.team1.pagination.Criteria;

@Service
public class TopGroupServiceImp implements TopGroupService {
	
   @Autowired
	TopGroupDAO  topGroupDao;

	@Override
	public ArrayList<TopGroupVO> getTopGroupList() {
		return topGroupDao.selectTopGroupList(); 
	}

	@Override
	public ArrayList<MidGroupVO> getMidGroupListByTopGroup(String tg_title) {
		if(tg_title.isEmpty() || tg_title.isBlank())
			return null;
		return topGroupDao.selectMidGroupListByTopGroup(tg_title);
	}

	@Override
	public ArrayList<ZipcodeVO> getSidoList() {
		return topGroupDao.selectSidoList();
	}

	@Override
	public ArrayList<ZipcodeVO> getSigunguList(String sido) {
		if(sido.isEmpty() || sido.isBlank())
			return null;
		return topGroupDao.selectSigunguList(sido);
	}

	@Override
	public ArrayList<ZipcodeVO> getDongList(String sido, String sigungu) {

		// 세종특별자치시인 경우
		if(sido.equals("세종특별자치시") || sigungu == null)
			return topGroupDao.selectdongListBySido(sido);

		// 위 경우 제외한 나머지
		if(sido.isEmpty() || sido.isBlank() || sigungu.isEmpty() || sigungu.isBlank())
			return null;
		return topGroupDao.selectdongList(sido, sigungu);
	}

	@Override
	public boolean insertTopGroup(String topGroup) {
		if(topGroup.isEmpty() || topGroup.isBlank())
			return false;
		return topGroupDao.insertTopGroup(topGroup);
	}

	@Override
	public boolean deleteTopGroup(int tg_num) {
		return topGroupDao.deleteTopGroup(tg_num);
	}

	@Override
	public boolean updateTopGroup(int tg_num, String topGroup) {
		if(topGroup.isEmpty() || topGroup.isBlank())
			return false;
		return topGroupDao.updateTopGroup(tg_num, topGroup);
	}

	@Override
	public TopGroupVO getTopGroup(int topNum) {
		return topGroupDao.selectTopGroup(topNum); 
	}

	@Override
	public TopGroupVO getTopGroupByName(String topName) {
		return topGroupDao.selectTopGroupByName(topName); 
	}

	@Override
	public ArrayList<TopGroupVO> getTopGroupListByCri(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(1,5);
		}
		return topGroupDao.selectTopGroupListByCri(cri); 
	}

	@Override
	public int getTopGroupTotalCount() {
		return topGroupDao.selectTopGroupTotalCount(); 
	}
}