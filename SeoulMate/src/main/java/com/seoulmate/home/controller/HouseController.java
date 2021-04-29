package com.seoulmate.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoulmate.home.service.HouseService;

@Controller
public class HouseController {
	@Inject
	HouseService service;
	
	@RequestMapping("/houseIndex")
	public String houserIndex() {
	return "house/houseIndex";
	}
	
	@RequestMapping("/houseSearch")
	public String houseSearch() {
		return "house/houseSearch";
	}
	
	@RequestMapping("/houseWrite1")
	public String houseWirte1() {
		return "house/houseWrite1";
	}
	
	@RequestMapping("/houseEdit")
	public String houseEdit() {
		return "house/houseEdit";
	}
}
