package kr.kh.team1.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.team1.model.vo.FileVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.PickVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReviewTypeVO;
import kr.kh.team1.pagination.Criteria;
import kr.kh.team1.pagination.MainCriteria;
import kr.kh.team1.pagination.ProductCriteria;

public interface ProductService {

	ArrayList<ProductVO> getProductList(int mNum, Criteria cri);

	int getProductTotalCount(int mNum, Criteria cri);

	String getMaxPrice(int mNum, Criteria cri);

	String  getMinPrice(int mNum, Criteria cri);

	String  getAvgPrice(int mNum, Criteria cri); 

	ArrayList<ProductVO> getMypagePro(String me_id, String clickData, String type);

	MidGroupVO getMidGroup(String mg_title);

	ArrayList<FileVO> getFileBypNum(int pNum);

	ProductVO getProductInfo(int pNum);

	boolean insertProduct(ProductVO product, MemberVO user, MultipartFile[] file, String mg_title);

	MemberVO getMemberInfoByUser(String pr_me_id);

	void insertPickByUserAndNum(String me_id, int pr_num);

	void upView(int pNum);

	PickVO getPickByUserAndNum(String me_id, int pNum);

	boolean deletePickByUserAndNum(String me_id, int pr_num);

	String getMsg(String pr_me_id, String me_id);

	String booleanPick(String me_id, int pr_num, PickVO isPick);

	void addPick(int pr_num);

	boolean upProduct(MemberVO user, ProductVO pro);

	int getTopNum(int num);

	void deleteFile(Integer integer);

	int updateProduct(ProductVO pro, MemberVO user, List<Integer> resultList, List<MultipartFile> files);

	String getSearchMaxPrice(ProductCriteria cri);

	String getSearchAvgPrice(ProductCriteria cri);

	String getSearchMinPrice(ProductCriteria cri);

	ArrayList<ProductVO> getSearchList(ProductCriteria cri);

	int getSearchTotalCount(ProductCriteria cri);

	ArrayList<ProductVO> getNewProducts(MainCriteria cri);

	ArrayList<ProductVO> getNewProductsByStart(int start);

	ArrayList<ProductVO> getPopularProducts();

	ArrayList<ProductVO> getPopularProductsByStart(int start);  

}
