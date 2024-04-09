package kr.kh.team1.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ChatRoomVO {
	
	private int cr_num; 
	private int cr_pr_num; 
	private String cr_me_id;
	
	private ProductVO product;
}