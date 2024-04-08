package kr.kh.team1.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ChatStateVo {
	
	private int cs_num; 
	private int cs_cr_num; 
	private String cs_me_id; 
	private String cs_state;
}