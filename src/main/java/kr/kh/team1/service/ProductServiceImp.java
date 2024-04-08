package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import kr.kh.team1.dao.ProductDAO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;

public class ProductServiceImp implements ProductService{
	
	@Autowired
	ProductDAO productDao;

	@Override
	public ArrayList<ProductVO> getProductList(Criteria cri) {
		if(cri == null)
			cri = new Criteria();
		return productDao.selectProductList(cri);
	}

	

}
