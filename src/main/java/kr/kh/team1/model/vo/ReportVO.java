package kr.kh.team1.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {
	private int re_num; 
	private int re_pr_num; 
	private String re_me_id;
	private String re_name; 
	private String re_content; 
	private Date re_date; 
	private int re_cr_num;
	
	private int me_report_count;
	private Date me_stop_date;
	
	public ReportVO(String re_me_id, String re_name, String re_content) {
		this.re_me_id = re_me_id;
		this.re_name = re_name;
		this.re_content = re_content;
	}

	public ReportVO(int pr_num, String re_me_id, String re_name, String re_content) {
		this.re_pr_num = pr_num;
		this.re_me_id = re_me_id;
		this.re_name = re_name;
		this.re_content = re_content;
	}
	
	

}
