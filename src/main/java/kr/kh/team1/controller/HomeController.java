package kr.kh.team1.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.kh.team1.model.vo.ChatMessageVO;
import kr.kh.team1.model.vo.MidGroupVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.service.ChatService;
import kr.kh.team1.service.MemberService;
import kr.kh.team1.service.MidGroupService;
import kr.kh.team1.service.TopGroupService;

@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
    @Autowired
	TopGroupService topGroupService;
    
    @Autowired
	MidGroupService midGroupService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {;
		return "/main/home"; 
	}
	
	@ResponseBody 
	@RequestMapping(value = "/top/group", method = RequestMethod.GET)
	public Map<String, Object> topGroup(Locale locale, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList <TopGroupVO> topGroupList = topGroupService.getTopGroupList(); 
		ArrayList <MidGroupVO> midGroupList = midGroupService.getMidGroupList();
		map.put("mList", midGroupList);
		map.put("tList", topGroupList);
		return map;
	}
}