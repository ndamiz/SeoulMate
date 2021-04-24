package com.seoulmate.home.member;

import java.util.Calendar;

import javax.servlet.http.HttpSession;

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
		String arr1[] = {"010"," 02"," 031","032","033","041","042","043","044","051","052","053","054","055","061","062","063","064"};
		String guArr[]= {"강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구"
				,"동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"};
		
		mav.addObject("year", year);
		mav.addObject("arr1", arr1);
		mav.addObject("guArr", guArr);
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
	public ModelAndView memberOk(MemberVO vo, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("home");
		
		// session.setAttribute("logId", vo.getUserid());
		System.out.println("아이디 : "+vo.getUserid());
		System.out.println("비밀번호 : "+vo.getUserpwd());
		System.out.println("이름 : "+vo.getUsername());
		System.out.println("연락처 전체 : "+vo.getTel());
		System.out.println("연락처1 : "+vo.getTel1());
		System.out.println("연락처2 : "+vo.getTel2());
		System.out.println("연락처3 : "+vo.getTel3());
		System.out.println("생년월일 : "+vo.getBirth());
		System.out.println("년 : "+vo.getBirth1());
		System.out.println("월 : "+vo.getBirth2());
		System.out.println("일 : "+vo.getBirth3());
		System.out.println("희망지역 전체 : "+vo.getArea());
		System.out.println("희망1 : "+vo.getArea1());
		System.out.println("희망2 : "+vo.getArea2());
		System.out.println("희망3 : "+vo.getArea3());
		System.out.println("이메일 전체 : "+vo.getEmail());
		System.out.println("이메일 아이디 : "+vo.getEmailid());
		System.out.println("이메일 도메인 : "+vo.getEmaildomain());
		
		session.setAttribute("logId", "3536cjw");
		
		return mav;
	}
	@RequestMapping("/memberEdit")
	public String memberEdit() {
		
		return "member/memberEdit";
	}
	
	@RequestMapping(value="/memberEditForm", method=RequestMethod.POST)
	public ModelAndView memberEditForm(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		String arr1[] = {"010"," 02"," 031","032"," 033"," 041"," 042"," 043"," 044"," 051"," 052"," 053"," 054"," 055"," 061"," 062"," 063"," 064"};
		String guArr[]= {"강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구"
				,"동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"};
		
		mav.addObject("arr1", arr1);
		mav.addObject("guArr", guArr);
		
		MemberDAOImp dao=sqlSession.getMapper(MemberDAOImp.class);
		MemberVO vo=new MemberVO();
		vo=dao.memberSelect((String)session.getAttribute("logId"));
		
		mav.addObject("vo", dao.memberSelect((String)session.getAttribute("logId")));
		
		mav.setViewName("member/memberEditForm");
		
		return mav;
	}
	
	@RequestMapping(value="/memberEditOk", method=RequestMethod.POST)
	public ModelAndView memberEditOk(MemberVO vo, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		vo.setUserid((String)session.getAttribute("logId"));
		
		MemberDAOImp dao=sqlSession.getMapper(MemberDAOImp.class);
		int pwdResult=dao.memberPwdSelect(vo.getUserid(), vo.getUserpwd());
		
		/*
		System.out.println("아이디 : "+vo.getUserid());
		System.out.println("비밀번호 : "+vo.getUserpwd());
		System.out.println("연락처 전체 : "+vo.getTel());
		System.out.println("희망지역 전체 : "+vo.getArea());
		System.out.println("희망1 : "+vo.getArea1());
		System.out.println("희망2 : "+vo.getArea2());
		System.out.println("희망3 : "+vo.getArea3());
		System.out.println("이메일 전체 : "+vo.getEmail());
		System.out.println("이메일 아이디 : "+vo.getEmailid());
		System.out.println("이메일 도메인 : "+vo.getEmaildomain());
		*/
		
		if(pwdResult==0) {
			System.out.println("비밀번호를 바꾸는 경우");
		}else {
			System.out.println("비밀번호를 바꾸지 않는 경우");
		}
		
		mav.setViewName("redirect:/");
		return mav;
	}
	
	@RequestMapping("/memberExit")
	public String memberExit() {
		
		return "member/memberExit";
	}
	
	@RequestMapping("/memberExitOk")
	public String memberExitOk() {
		
		return "home";
	}
	
	@RequestMapping("/memberProEdit")
	public String memberProEdit() {
		
		return "member/memberProEdit";
	}
	
	@RequestMapping("/memberProEditForm")
	public ModelAndView memberProEditForm() {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("no1", "no1");
		mav.setViewName("member/memberProEditForm");
		
		return mav;
	}
	
	@RequestMapping("/proInsertOk")
	public String proInsertOk() {
		return "home";
	}
	
	@RequestMapping("/memberFind")
	public String memberFind() {
		return "member/memberFind";
	}
	
	@RequestMapping("/sample")
	public String sample() {
		return "member/sample";
	}
	
}
