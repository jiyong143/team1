package kr.kh.team1.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Criteria {
	
	private int page = 1;//현재 페이지 : 기본값 - 1
	private int perPageNum = 10;//한 페이지에서 컨텐츠 개수 : 기본값 - 10
	private String search = ""; // 제목, 내용  검색어 
	private String order = "pr_num"; // 정렬순의 기본은 최신순 : 거래글

	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	public int getPageStart() {
		return (page - 1) * perPageNum; 
	}
}