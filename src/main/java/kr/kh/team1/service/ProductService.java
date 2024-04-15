package kr.kh.team1.service;
import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;

public interface ProductService {

	ArrayList<ProductVO> getProductList(int mNum, Criteria cri);

	int getProductTotalCount(int mNum, Criteria cri);

	boolean insertProduct(ProductVO product, MemberVO user, MultipartFile[] file, String mg_title);
}