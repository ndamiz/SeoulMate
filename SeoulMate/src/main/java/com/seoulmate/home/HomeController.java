package com.seoulmate.home;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.HomeService;
import com.seoulmate.home.service.MemberService;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MemberVO;

@Controller
public class HomeController {
	
	@Inject
	HomeService service;
	@Inject
	MemberService memberService;
	
	@SuppressWarnings("null")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) {
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
		
		//////////////////////////////////////////////////
		
		if(session.getAttribute("logId")!=null) {
			MemberVO memberVO = new MemberVO();
			memberVO = memberService.memberSelect((String)session.getAttribute("logId"));
			mav.addObject("memberVO", memberVO);
		}
		
		// 쉐어하우스 최신리스트 구하기
		List<HouseWriteVO> lst = service.getNewHouse();
		
		for (HouseWriteVO hwVO : lst) {
			// 각 쉐어하우스의 제일 저렴한 월세 가져오기
			HouseRoomVO hrVO = service.getDesposit(hwVO.getNo());
			hwVO.setDeposit(hrVO.getDeposit());
			hwVO.setRent(hrVO.getRent());
		}
		
		mav.addObject("newHouseList", lst);
		mav.setViewName("home");
		return mav;
	}
}
