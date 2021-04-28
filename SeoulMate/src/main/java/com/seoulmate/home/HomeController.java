package com.seoulmate.home;

import java.util.Arrays;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.HomeService;

@Controller
public class HomeController {
	
	@Inject
	HomeService service;
	
	@SuppressWarnings("null")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		
		// 로그인전 하우스 맵 정보 구하기
		String[] houseMapList = service.getHouseMap();
		mav.addObject("houseMapList",houseMapList);
		
		// 로그인전 메이트 맵 정보 구하기
		String[] getMateList = service.getMateMap();
		String[] mateListArr = null;
		String[] mateMapList = null;
		String arr = "";
		
		for (int i = 0; i < getMateList.length; i++) {
			mateListArr = getMateList[i].split("/");
			for (String j : mateListArr) {
				arr += "'" + j + "',";
			}
		}
		mateMapList = arr.split(",");
		arr = Arrays.toString(mateMapList);
		
		mav.addObject("mateMapList",arr);
		mav.setViewName("home");
		return mav;
	}
}
