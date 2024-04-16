package kr.kh.team1.model.vo;

import java.util.Date;

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
		Date now = new Date();
		long milliseconds1 = now.getTime();
		long milliseconds2 = pr_date.getTime();
	    long diff =  (long) Math.floor((milliseconds1 - milliseconds2) / 1000);
	    
	    // 초, 분, 시간, 일  초 기준으로  정의
	    int second = 1;
	    int minute = 60 * second;
	    int hour = 60 * minute;
	    int day = 24 * hour;
	    
	    String elapsedText = "";
	    
	    if (diff < minute) {
	        elapsedText = diff + "초 전"; 
	    } else if (diff < hour) {
	        elapsedText = (int)Math.floor(diff / minute) + "분 전";  
	    } else if (diff < day) {
	        elapsedText = (int)Math.floor(diff / hour) + "시간 전"; 
	    } else if (diff < (day * 15)) {
	        elapsedText = (int)Math.floor(diff / day) + "일 전"; 
	    } else {
	        elapsedText = this.pr_date + "";
	    }
	    
	    return elapsedText;
	}

		
		
				
		
		
		
		
		
	}

