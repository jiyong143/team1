package kr.kh.team1.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PickVO {
	private int pi_num;
	private String pi_me_id;
	private int pi_pr_num;
	private String pr_name;
	private String pr_price;
}