package kr.kh.team1.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TradeOutcomeVO {
	int to_num;
	String to_rt_type;
	int to_tr_num;
	int to_type; //구매자는 0 판매자는 1
	int to_tr_type_count; //각 타입 당 얼마나 선택되었는지 확인하는 변수
}
