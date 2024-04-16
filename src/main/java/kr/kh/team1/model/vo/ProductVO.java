package kr.kh.team1.model.vo;
import java.sql.Date;
import java.util.Calendar;

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
	private String pr_mg_name;
	private String pr_tg_name;
	

	// 현재 시간을 가져와서 상품 객체의 pr_date와 차이를 계산하고 경우에 따라서 얼마전인지(년,월,일,시,분,초)를 출력하는 메서드
	public String getTime() {
		
		Calendar now = Calendar.getInstance();
		
		long milliseconds1 = now.getTimeInMillis();
		 
		Calendar pr_date = Calendar.getInstance(); 
		pr_date.setTime(this.pr_date);
		
		long milliseconds2 = pr_date.getTimeInMillis();
		
		long diff = milliseconds1 - milliseconds2;
        long diffDays = diff / (24 * 60 * 60 * 1000); // 밀리초를 일로 변환
		
		 
        return diffDays + "일 전"; 
		
	}
		
		
				
		
		
		
		
		
	}

