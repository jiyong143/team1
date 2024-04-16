package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.team1.model.vo.FileVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;

public interface ProductService {

	ArrayList<ProductVO> getProductList(int mNum, Criteria cri);

	int getProductTotalCount(int mNum, Criteria cri);

	int getMaxPrice(int mNum, Criteria cri);

	int getMinPrice(int mNum, Criteria cri);

	int getAvgPrice(int mNum, Criteria cri);

	boolean insertProduct(ProductVO product, MemberVO user, MultipartFile[] file, String mg_title);

	MidGroupVO getMidGroup(String mg_title);

	ArrayList<ProductVO> getMypagePro(String me_id, String clickData);

	ArrayList<FileVO> getFileBypNum(int pNum);

}
