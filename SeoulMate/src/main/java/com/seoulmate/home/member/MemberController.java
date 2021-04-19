package com.seoulmate.home.member;

import java.util.Calendar;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/memberForm")
	public ModelAndView memForm() {
		ModelAndView mav=new ModelAndView();
		Calendar now=Calendar.getInstance();
		int year=now.get(Calendar.YEAR);
		String arr1[] = {"010"," 02"," 031","032"," 033"," 041"," 042"," 043"," 044"," 051"," 052"," 053"," 054"," 055"," 061"," 062"," 063"," 064"};
		
		mav.addObject("arr1", arr1);
		mav.addObject("year", year);
		mav.setViewName("member/memberForm");
		
		return mav;
	}
	
	@RequestMapping("/idCheck")
	public ModelAndView idCheck(String userid) {
		String useridCheck=userid;
		MemberDAOImp dao=sqlSession.getMapper(MemberDAOImp.class);
		
		int result=dao.idCheck(useridCheck);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("userid", useridCheck);
		mav.addObject("checkResult", result);
		mav.setViewName("member/idCheck");
		
		return mav;
	}
	
	@RequestMapping(value="/memberOk", method=RequestMethod.POST)
	public ModelAndView memberOk(MemberVO vo) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("home");
		
		System.out.println("memberForm에서 입력한 생년월일은 "+vo.getBirth());
		
		return mav;
	}
	@RequestMapping("/memberEdit")
	public String memberEdit() {
		
		return "member/memberEdit";
	}
	
	@RequestMapping(value="/memberEditForm", method=RequestMethod.POST)
	public ModelAndView memberEditForm(String userpwd) {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("pwd", userpwd);
		System.out.println("memberEdit에서 입력한 비밀번호 : "+userpwd);
		mav.setViewName("home");
		
		return mav;
	}
}
