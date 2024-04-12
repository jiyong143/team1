package kr.kh.team1.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ChatMessageVO {
	
	private int cm_num;
	private int cm_cr_num;
	private String cm_me_id;
	private String cm_content; 
	private Date cm_time;
	
	public String getDate_str() {
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		 String dateString = sdf.format(cm_time);
		 
		 return dateString;
	}
}