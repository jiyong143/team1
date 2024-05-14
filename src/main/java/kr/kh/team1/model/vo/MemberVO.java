package kr.kh.team1.model.vo;


import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {

	private String me_id;
	private String me_pw;
	private String me_pw2;
	private String me_email;
	private String me_gender;
	private String me_name;
	private Date me_birth;
	private String me_phone;
	private String me_addr;
	private String me_authority;
	private String me_state;
	private double me_manner;
	private int me_point;
	private int me_fi_num;
	private int me_payment;
	private int me_report_count;
	private Date me_stop_date;

}
