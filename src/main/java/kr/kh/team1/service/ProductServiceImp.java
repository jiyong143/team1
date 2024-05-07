package kr.kh.team1.service;

import java.text.DecimalFormat;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team1.dao.ProductDAO;
import kr.kh.team1.model.vo.FileVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.PickVO;
import kr.kh.team1.model.vo.ProductVO;
import kr.kh.team1.model.vo.ReviewTypeVO;
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
	public ArrayList<ProductVO> getMypagePro(String me_id, String clickData, String type) {
		if(clickData == null || clickData.length()==0) {
			return null;
		}
		return productDao.selectMypagePro(me_id, clickData, type);
	}	

	@Override
	public String getMinPrice(int mNum, Criteria cri) {
		int minPrice =  productDao.selectMinPrice(mNum,cri); 
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(minPrice);

	}

	@Override
	public String getMaxPrice(int mNum, Criteria cri) {
		int maxPrice = productDao.selectMaxPrice(mNum,cri); 
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(maxPrice);

	}

	@Override
	public String getAvgPrice(int mNum, Criteria cri) {
		int avgPrice =  productDao.selectAvgPrice(mNum,cri); 
		DecimalFormat df = new DecimalFormat("###,###");
		return df.format(avgPrice);

	}

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

	@Override
	public ArrayList<FileVO> getFileBypNum(int pNum) {
		return productDao.selectFileBypNum(pNum);
	}

	@Override
	public ProductVO getProductInfo(int pNum) {
		return productDao.selectProductInfoByNum(pNum); 
	}

	@Override
	public MemberVO getMemberInfoByUser(String pr_me_id) {
		if(!checkString(pr_me_id))
			return null;
		return productDao.selectMemberInfoByUser(pr_me_id);
	}

	@Override
	public void insertPickByUserAndNum(String me_id, int pr_num) {
		if(!checkString(me_id))
			return;
		productDao.insertPickByUserAndNum(me_id, pr_num);
		return;
	}

	@Override
	public void upView(int pNum) {
		productDao.updateView(pNum);
		return;
	}

	@Override
	public PickVO getPickByUserAndNum(String me_id, int pNum) {
		if(!checkString(me_id))
			return null;
		return productDao.selectPickByUserAndNum(me_id, pNum);
	}

	@Override
	public boolean deletePickByUserAndNum(String me_id, int pr_num) {
		if(!checkString(me_id))
			return false;
		return productDao.deletePickByUserAndNum(me_id, pr_num);
	}

	@Override
	public String getMsg(String pr_me_id, String me_id) {
		if(!checkString(pr_me_id) || !checkString(me_id))
			return null;
		
		if(!pr_me_id.equals(me_id))
			return null;
   		
		return "본인은 찜할 수 없습니다.";
	}

	@Override
	public String booleanPick(String me_id, int pr_num, PickVO isPick) {
		if(!checkString(me_id))
			return null;
		
		if(isPick == null) {
			productDao.insertPickByUserAndNum(me_id, pr_num);
			return "insert";
		}else {
			productDao.deletePickByUserAndNum(me_id, pr_num);
			return "delete";
		}
	}

	@Override
	public void addPick(int pr_num) {
		productDao.updatePick(pr_num);
		
	}

	@Override
	public boolean upProduct(MemberVO user, ProductVO pro) {
		if(user==null||!user.getMe_id().equals(pro.getPr_me_id())) {
			return false;
		}
		int num = pro.getPr_num();
		return productDao.updateTime(num); 
	}
	

	@Override
	public int getTopNum(int num) {
		return productDao.selectTopNum(num); 
	}

}