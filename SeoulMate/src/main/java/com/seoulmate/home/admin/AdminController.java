package com.seoulmate.home.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@Autowired
	SqlSession sqlSession;
	
	//admin에 들어오면 나오는 대시보드
	@RequestMapping("/admin")
	public String adminDashboard() {
		return "/admin/adminDashboard";
	}
	
	//신고관리
	@RequestMapping("/admin/reportManagement")
	public String adminReport() {
		return "/admin/reportManagement";
	}
	//관리자-회원
	@RequestMapping(value="/admin/memberManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memberManagement() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/memberManagement");
		return mav;
	}
	//관리자 - 쉐어하우스 
	@RequestMapping(value="/admin/houseManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView houseManagement() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/houseManagement");
		return mav;
	}
	//관리자 - 하우스메이트 
	@RequestMapping(value="/admin/mateManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mateManagement() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("admin/mateManagement");
		return mav;
	}
	//관리자 - 결제 
	@RequestMapping(value="/admin/payManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView payManagement() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("admin/payManagement");
		return mav;
	}
	//관리자 - 매출
	@RequestMapping(value="/admin/salesManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView salesManagement() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("admin/salesManagement");
		return mav;
	}
	//문의 관리
	@RequestMapping("/admin/qnaManagement")
	public String qnaManagement() {
		return "/admin/qnaManagement";
	}
}
