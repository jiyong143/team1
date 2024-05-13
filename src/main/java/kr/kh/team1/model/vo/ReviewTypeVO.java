package kr.kh.team1.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReviewTypeVO {
	String rt_type;
	int count;
	int rt_point;
}
