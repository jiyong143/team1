package kr.kh.team1.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {

	private String me_id; 
	private String me_pw;
	private String me_email; 
	private String me_gender;
	private String me_name; 
	private int me_birth;
	private String me_phone;
	private String me_addr; 
	private String me_authority; 
	private String me_state; 
	private String me_manner;

}
