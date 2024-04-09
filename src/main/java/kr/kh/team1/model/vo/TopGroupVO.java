package kr.kh.team1.model.vo;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import kr.kh.team1.service.MidGroupService;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TopGroupVO { 
	
	private int tg_num; 
	private String tg_title;
	private ArrayList<MidGroupVO> midGroupList; 
	

}
