package kr.kh.team1.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team1.model.vo.SurportVO;
import kr.kh.team1.service.SuportService;

@Controller
public class LKJController {

	@Autowired
	private SuportService surportService;
	
	@GetMapping("/suport/list")
	public String surportList(Model model) {
		ArrayList<SurportVO> list = surportService.getSurportList();
		
		return "/surport/list";
	}
}
