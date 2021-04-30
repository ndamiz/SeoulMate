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

	@RequestMapping("/mateView")
	public String houseSearch() {
		return "mate/mateView";
	}
	
	@RequestMapping("/mateWrite1")
	public String mateWrite1() {
	return "mate/mateWrite1";
	}
	
	@RequestMapping("/mateEdit")
	public String mateEdit() {
		return "mate/mateEdit";
	}
}
