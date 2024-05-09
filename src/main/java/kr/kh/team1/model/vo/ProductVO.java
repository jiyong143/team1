package kr.kh.team1.model.vo;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
	private ArrayList <FileVO> fileList;  
	private String pr_date2;
	private String tg_title;
	private String mg_title;
	private int listSize;
	private int pr_pickCount;
	private int pr_chatCount;
	
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
	    } else if (diff < (day * 30)) {
	        elapsedText = (int)Math.floor(diff / day) + "일 전"; 
	    } else {
	        elapsedText = changeDate();
	    }
	    
	    return elapsedText;
	}
	
	// 상품의 양수 가격을 천단위로 콤마로 찍어서 출력하는 메서드
	public String getPrice() {
		
		DecimalFormat df = new DecimalFormat("###,###");
		String formatMoney = df.format(this.pr_price);
		return formatMoney;	
	}
	
	// 날짜를 이쁘게 문자열로 바꿔서 반환하는 메서드
	public String changeDate() { 
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(pr_date);
	}
	
	// 주소의 동만 반환하는 메서드 
	public String getDong() {
		String addr = pr_place;
		String[] components = addr.split(" ");
		return components[2];
	}
	
	// 상품 설명에 있는 태그들 지워서 반환하는 메서드 
	public  String getContent() {
        // HTML 태그를 제외한 모든 문자를 가져오는 정규식
        String regex = "\\<[^>]*>";
        
        // 정규식을 사용하여 HTML 태그를 제거하고 문자열을 반환
        return pr_content.replaceAll(regex, "");
    }

}

