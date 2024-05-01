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
	private String re_state;

}
