package kr.kh.team1.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MessageDTO {
	
	private int cm_cr_num;
	private String cm_me_id;	// 보낸 사람
	private String cm_content;	// 내용

}