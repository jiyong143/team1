package kr.kh.team1.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SurportVO {
	private int su_num; 
	private String su_me_id; 
	private String su_title;
	private String su_content; 
	private Date su_date;
	private int su_view; 
}
