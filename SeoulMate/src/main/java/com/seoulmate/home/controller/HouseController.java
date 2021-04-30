package com.seoulmate.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.seoulmate.home.service.HouseService;

@Controller
public class HouseController {
	@Inject
	HouseService service;
	
	@RequestMapping("/houseIndex")
	public String houserIndex() {
	return "house/houseIndex";
	}
	
	@RequestMapping("/houseView")
	public String houseSearch() {
		return "house/houseView";
	}
	
	//하우스 글 등록
	@RequestMapping("/houseWrite1")
	public String houseWirte1() {
		return "house/houseWrite1";
	}
	
	//하우스 글 등록 확인
//	@RequestMapping(value="/houseWriteOk", method = RequestMethod.POST)
//	public String houseWriteOk(houseWriteVO hVo, houseRoomVO rVO, HttpServletRequest req) {
//		
//	};
	
	
	//하우스 등록 수정
	@RequestMapping("/houseEdit")
	public String houseEdit() {
		return "house/houseEdit";
	}
}
