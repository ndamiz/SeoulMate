package com.seoulmate.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoulmate.home.service.MateService;

@Controller
public class MateController {
	@Inject
	MateService service;
	
	@RequestMapping("/mateIndex")
	public String mateIndex() {
	return "mate/mateIndex";
	}

	@RequestMapping("/mateWrite1")
	public String mateWrite1() {
	return "mate/mateWrite1";
	}
	
	@RequestMapping("/mateWrite2")
	public String mateWrite2() {
	return "mate/mateWrite2";
	}
	
	@RequestMapping("/mateWrite3")
	public String mateWrite3() {
	return "mate/mateWrite3";
	}
	
	@RequestMapping("/mateWrite4")
	public String mateWrite4() {
	return "mate/mateWrite4";
	}

	@RequestMapping("/mateWrite5")
	public String mateWrite5() {
	return "mate/mateWrite5";
	}

	@RequestMapping("/mateWrite6")
	public String mateWrite6() {
	return "mate/mateWrite6";
	}
	
	@RequestMapping("/mateSearch")
	public String mateSearch() {
		return "mate/mateSearch";
	}
}
