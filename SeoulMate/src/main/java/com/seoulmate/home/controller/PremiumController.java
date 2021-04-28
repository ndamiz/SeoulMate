package com.seoulmate.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.MemberService;
import com.seoulmate.home.service.PremiumService;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PayVO;
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
	@RequestMapping(value="/premiumPayOk", method=RequestMethod.POST)
	public String premiumPayOk(PayVO payVO) {
		ModelAndView mav = new ModelAndView();
		System.out.println("결제 아이디 : "+payVO.getUserid()+", 결제한 사람이름 : "+payVO.getUsername());
		System.out.println("고유결제 아이디 : "+payVO.getImp_uid());
		System.out.println("주문번호 : "+payVO.getMerchant_uid());
		System.out.println("결제금액 : "+payVO.getAmount());
		System.out.println("결제수단 : "+payVO.getPayMethod());
		System.out.println("체크한 개월 수"+payVO.getPayMonth());
		
		payVO.setPayEnd(premiumService.payEndCalculate());
		System.out.println("지금으로부터 2개월 뒤 "+payVO.getPayEnd());
		return "home";
	}
}
