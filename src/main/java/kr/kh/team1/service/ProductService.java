package kr.kh.team1.service;
import java.util.ArrayList;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;

public interface ProductService {

	ArrayList<ProductVO> getProductList(int mNum, Criteria cri);

	int getProductTotalCount(int mNum, Criteria cri);

	int getMaxPrice(int mNum, Criteria cri);

	int getMinPrice(int mNum, Criteria cri);

	int getAvgPrice(int mNum, Criteria cri);

}
