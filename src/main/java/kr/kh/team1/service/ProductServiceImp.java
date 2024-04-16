package kr.kh.team1.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team1.dao.ProductDAO;
import kr.kh.team1.model.vo.FileVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.pagination.Criteria;
import kr.kh.team1.utils.UploadFileUtils;

@Service
public class ProductServiceImp implements ProductService{

	
	@Autowired
	ProductDAO productDao;
	
	@Resource
	private String uploadPath;
	
	private boolean checkString(String str) {
		return str != null && str.length() != 0;
	}
	
	private void uploadFile(int pr_num, MultipartFile file) {
		try {
			String originalFileName = file.getOriginalFilename();

			// 파일명이 없으면(UUID제외하고)
			if(originalFileName.length() == 0) {
				return;
			}
			
			// 서버에 업로드 후 업로드한 파일명(UUID포함)을 가져옴
			String fileName = UploadFileUtils.uploadFile
					(uploadPath, originalFileName,file.getBytes());
			// FileVO 객체를 생성
			FileVO fileVo = new FileVO(pr_num, originalFileName, fileName);
			System.out.println(fileVo);
			// DB에 추가
			productDao.insertFile(fileVo);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public MidGroupVO getMidGroup(String mg_title) {
		return productDao.selectMidGroup(mg_title);
	}

	@Override
	public ArrayList<ProductVO> getProductList(int mNum, Criteria cri) { 
		return productDao.selectProductList(mNum, cri);  
	}

	@Override
	public int getProductTotalCount(int mNum, Criteria cri) {
		return productDao.selectProductTotalCount(mNum, cri);  
  }

	@Override
	public int getMaxPrice(int mNum, Criteria cri) {
		return productDao.selectMaxPrice(mNum,cri); 
	}

	@Override
	public int getMinPrice(int mNum, Criteria cri) {
		return productDao.selectMinPrice(mNum,cri);
	}

	@Override
	public int getAvgPrice(int mNum, Criteria cri) {
		return productDao.selectAvgPrice(mNum,cri); 
	}

	

	@Override
	public boolean insertProduct(ProductVO product, MemberVO user, MultipartFile[] files, String mg_title) {
		// 작업 순서 : 게시글을 올리고 올려진 게시글에 첨부파일을 추가
		if(user == null || product == null) {
			return false;	
		}
		if(!checkString(product.getPr_name()) ||
			!checkString(product.getPr_content()) ||
			!checkString(product.getPr_place()) ||
			!checkString(mg_title)) {
			return false;	
		}
		
		MidGroupVO mid = getMidGroup(mg_title);
		product.setPr_me_id(user.getMe_id());
		product.setPr_mg_num(mid.getMg_num());
		boolean res = productDao.insertProduct(product);
		
		// 게시글 등록 실패
		if(!res) {
			return false;
		}
		// 첨부파일 업로드 작업
		// 첨부파일이 없는 경우
		if(files == null || files.length == 0) {
			return true;
		}
		for(MultipartFile file : files) {
			// 첨부파일을 서버에 업로드하고 DB에 추가하는 메서드
			uploadFile(product.getPr_num(), file);
		}
		return res;
	}
  
}