package kr.kh.team1.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SurportVO {
	private int sb_num; 
	private String sb_me_id; 
	private String sb_type;
	private String sb_content; 
	private Date sb_date;
}
