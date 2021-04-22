package com.seoulmate.home.mypage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MypageController {
	@Autowired
	SqlSession sqlSession;
	
	//마이페이지 찜목록
	@RequestMapping("/likeMarkerList")
	public ModelAndView likeMarkerList() {
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}
	//마이페이지 결제내역
	@RequestMapping("/payDetailList")
	public ModelAndView payDetailList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/payDetailList");
		return mav;
	}
	//마이페이지 보낸초대
	@RequestMapping("/sendInviteList")
	public ModelAndView sendInviteList() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
	//마이페이지 받은신청
	@RequestMapping("/takeRequestList")
	public ModelAndView takeRequestList() {
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
