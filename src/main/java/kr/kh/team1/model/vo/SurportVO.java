package kr.kh.team1.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SurportVO {	
	private int su_num; 
	private int su_sm_num;
	private int su_uh_num;
	private String su_me_id; 
	private String su_title;
	private String su_content; 
	private Date su_date;
	private int su_view;
	private SurportManageVO sm;
	private UpHeadVO uh;
	
	public SurportVO(int suNum, String id, String title, String content, Date date, int view) {
		this.su_num = suNum;
		this.su_me_id = id;
		this.su_title = title;
		this.su_content = content;
		this.su_date = date;
		this.su_view = view;
	}

	public SurportVO(int sm_name, int uh_name, int su_uh_num, String su_me_id, String su_title, String su_content) {
		this.su_sm_num = sm_name;
		this.su_uh_num = uh_name;
		this.su_uh_num = su_uh_num;
		this.su_me_id = su_me_id;
		this.su_title = su_title;
		this.su_content = su_content;
	}
	
	

	
	
	
}
