package kr.kh.team1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.kh.team1.service.TopGroupService;

@Controller
public class CJYController {

    @Autowired
	TopGroupService topGroupService;
    
    

}
