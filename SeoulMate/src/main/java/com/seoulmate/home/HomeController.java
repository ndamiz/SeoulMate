package com.seoulmate.home;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@Autowired
	SqlSession sqlSession;
	
	@SuppressWarnings("null")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		HomeDAOImp dao = sqlSession.getMapper(HomeDAOImp.class);
		
		// 로그인전 하우스 맵 정보 구하기
		String[] houseMapList = dao.getHouseMap();
		mav.addObject("houseMapList",houseMapList);
		
		// 로그인전 메이트 맵 정보 구하기
		String[] getMateList = dao.getMateMap();
		String[] mateListArr = null;
		String[] mateMapList = null;
		String arr = "";
		
		for (int i = 0; i < getMateList.length; i++) {
			mateListArr = getMateList[i].split("/");
			for (String j : mateListArr) {
				arr += j + ",";
			}
		}
		mateMapList = arr.split(",");
		
		mav.addObject("mateMapList",mateMapList);
		
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("/sample")
	public String sample() {
		return "sample";
	}
}
