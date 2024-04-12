package kr.kh.team1.controller;

import java.text.DateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.kh.team1.service.MemberService;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.model.vo.TopGroupVO;
import kr.kh.team1.service.TopGroupService;

@Controller
public class HomeController {
	
	@Autowired
	
	MemberService memberService;
	
    @Autowired
	TopGroupService topGroupService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		
		
		return "/main/home";
	}
	
}