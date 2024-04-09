package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.ProductVO;

public interface ProductService {

	ArrayList<ProductVO> getProductList(int mNum);

}
