package kr.kh.team1.model.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MessageDTO {
	
	private int cm_cr_num;
	private String cm_me_id;	// 보낸 사람
	private String cm_content;	// 내용
	private String cm_time;
	
	public MessageDTO(int cm_cr_num, String cm_me_id, String cm_content) {
		this.cm_cr_num = cm_cr_num;
		this.cm_me_id = cm_me_id;
		this.cm_content = cm_content;
	}
}