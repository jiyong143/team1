package kr.kh.team1.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentVO {
	private int co_num; 
	private String co_content;
	private int co_su_num;
	private String co_me_id;
	
	public CommentVO(String co_content, int co_su_num, String co_me_id) {
		this.co_content = co_content;
		this.co_su_num = co_su_num;
		this.co_me_id = co_me_id;
	}
}
