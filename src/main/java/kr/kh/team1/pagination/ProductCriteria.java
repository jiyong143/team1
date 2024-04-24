package kr.kh.team1.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductCriteria extends Criteria {
	
	
	private int minPrice=-1000000000; // 최소 가격(마이너스 무한대)
	private int maxPrice= 1000000000; // 최대 가격(무한대)
	private String place= ""; // 검색 장소
	private String apple = "no"; // 판매완료 상품 보는지 여부 (기본은 제외) 
	private String banana = "no"; // 판매완료 상품 보는지 여부 (기본은 제외)
	public ProductCriteria(int page, int perPageNum) {
		super(page, perPageNum);
	}
	
}