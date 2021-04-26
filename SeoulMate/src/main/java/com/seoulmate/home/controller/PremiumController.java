package com.seoulmate.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.MemberService;
import com.seoulmate.home.service.PremiumService;
import com.seoulmate.home.vo.MemberVO;
@Controller
public class PremiumController {
	@Inject
	PremiumService premiumService;
	@Inject
	MemberService memberService;
	
	@RequestMapping("/premiumInfo")
	public ModelAndView premiumInfo( MemberVO memberVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//결제를 위하여 세션에있는 id와, name을 사용하여 vo에 저장한다.  
		String userid = (String)session.getAttribute("logId");
		if(userid!=null) {
			//MemberDAO에 있는 회원정보 가져오기. 
			memberVO = memberService.memberSelect(userid);
			mav.addObject("memberVO", memberVO);
			mav.setViewName("premium/premiumInfo");
		}else {
			//로그인 하지않았다면 로그인 페이지로
			mav.setViewName("premium/premiumInfo");
		}
		return mav;
	}
	@RequestMapping("/premiumPay")
	public ModelAndView premiumPay(MemberVO memberVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		if(userid!=null) {
			//MemberDAO에 있는 회원정보 가져오기. 
			memberVO = memberService.memberSelect(userid);
			mav.addObject("memberVO", memberVO);
			mav.setViewName("premium/premiumInfo");
		}else {
			//로그인 하지않았다면 로그인 페이지로
			mav.setViewName("premium/premiumInfo");
		}
		mav.setViewName("premium/premiumPay");
		return mav;
	}
}
