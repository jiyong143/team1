package kr.kh.team1.model.vo;

import java.sql.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ProductVO {
	
	int pr_num; 
	int pr_mg_num;
	String pr_me_id;
	String pr_name;
	String pr_place; 
	String pr_content;  
	int pr_price; 
	String pr_ps_state;  
	int pr_basket; 
	int pr_view; 
	Date pr_date; 
	String pr_buyId;
	String pr_mg_name;
	String pr_tg_name;

}
