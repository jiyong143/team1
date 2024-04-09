package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.ProductDAO;
import kr.kh.team1.model.vo.ProductVO;

@Service
public class ProductServiceImp implements ProductService{
	
	@Autowired
	ProductDAO productDao;

	@Override
	public ArrayList<ProductVO> getProductList() {
		//거래글 리스트 불러오기
		return productDao.selectProductList();
	}

}
