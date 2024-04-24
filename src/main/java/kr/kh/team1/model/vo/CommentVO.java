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
}
