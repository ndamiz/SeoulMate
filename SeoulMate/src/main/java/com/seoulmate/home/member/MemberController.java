package com.seoulmate.home.member;

import java.util.Calendar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@RequestMapping("/memberForm")
	public ModelAndView memForm() {
		ModelAndView mav=new ModelAndView();
		Calendar now=Calendar.getInstance();
		int year=now.get(Calendar.YEAR);
		
		mav.addObject("year", year);
		mav.setViewName("member/memberForm");
		
		return mav;
	}
	
}
