package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.ProductDAO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;

@Service
public class ProductServiceImp implements ProductService{

	
	@Autowired
	ProductDAO productDao;

	@Override
	public ArrayList<ProductVO> getProductList(int mNum, Criteria cri) { 
		return productDao.selectProductList(mNum, cri);  
	}

	@Override
	public int getProductTotalCount(int mNum, Criteria cri) {
		return productDao.selectProductTotalCount(mNum, cri);  
  }

	@Override
	public ArrayList<ProductVO> getMypagePro(String me_id, String clickData) {
		if(clickData == null || clickData.length()==0) {
			return null;
		}
		return productDao.selectMypagePro(me_id, clickData);
	}

  
}