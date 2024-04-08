package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;

@Service
public interface ProductService {

	ArrayList<ProductVO> getProductList(Criteria cri);



}
