package kr.kh.team1.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PaymentVO {
	int pd_num;
	String pd_oriNum; //유니크
	int pd_price;
	String pd_me_id;
}
