package kr.kh.team1.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FixedVO {
	private int fix_num;
	private String fix_me_id;
	private String fix_title;
	private String fix_content;
	private Date fix_date;
	private int fix_view;

}
