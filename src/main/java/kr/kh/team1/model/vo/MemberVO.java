package kr.kh.team1.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	String me_id;
	String me_pw;
	String me_email;
	String me_gender;
	String me_name;
	Date me_birth;
	String me_phone;
	String me_addr;
	String me_authority;
	String me_state;
	double me_manner;
	int me_fi_num;
	String me_pw2;
}
