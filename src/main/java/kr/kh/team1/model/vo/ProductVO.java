package kr.kh.team1.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductVO {
	
	private int pr_num; 
	private int pr_mg_num;
	private String pr_me_id;
	private String pr_name;
	private String pr_place; 
	private String pr_content;  
	private int pr_price; 
	private String pr_ps_state;  
	private int pr_basket; 
	private int pr_view; 
	private Date pr_date; 
	private String pr_buyId;

}
