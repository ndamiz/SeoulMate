package com.seoulmate.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.MemberService;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PropensityVO;
@Controller
public class MemberController {
	@Inject
	MemberService service;
	
	
	@RequestMapping("/idCheck")
	public ModelAndView idCheck(String userid) {
		String useridCheck=userid;
		
		
		int result=service.idCheck(useridCheck);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("userid", useridCheck);
		mav.addObject("checkResult", result);
		mav.setViewName("member/idCheck");
		
		return mav;
	}
	@RequestMapping(value="/memberOk", method=RequestMethod.POST)
	public ModelAndView memberOk(MemberVO vo, PropensityVO proVO,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("home");
		
		proVO.setUserid(vo.getUserid()); // 성향 테이블에 userid 추가
		
		int result=service.memberInsert(vo);
		if(result>0) { // 회원가입 성공
			int pResult=service.propInsert(proVO);
			if(pResult>0) { // 성향 등록 성공
				mav.setViewName("redirect:login");
			}else {
				mav.setViewName("redirect:memberForm");
			}
			
		}else { // 회원가입 실패
			mav.setViewName("redirect:memberForm");
			// 나중에 history.back() 해줘야 함
		}
		/*
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
		*/
		
		return mav;
	}
	
	@RequestMapping("/login")
	public String loginForm() {
		return "member/login";
	}


	@RequestMapping(value="/loginOk", method = RequestMethod.POST)
	public ModelAndView loginCheck(String userid, String userpwd, HttpSession session) {
		MemberVO logVO = service.loginCheck(userid, userpwd);

		ModelAndView mav = new ModelAndView();
		if (logVO==null) { // 로그인 실패
			mav.addObject("logState", "fail");
			mav.setViewName("member/login");
		} else if(logVO.getState().equals("블랙") || logVO.getState().equals("탈퇴")) {
			mav.addObject("logState", logVO.getState());
			mav.setViewName("member/login");
		}
		else { // 로그인 성공
			session.setAttribute("logId", logVO.getUserid());
			session.setAttribute("logName", logVO.getUsername());
			session.setAttribute("logGrade", logVO.getGrade());
			mav.setViewName("redirect:/");
		}

		return mav;
    }
	
	@RequestMapping("/memberEdit")
	public String memberEdit() {
		
		return "member/memberEdit";
	}
	
	@RequestMapping(value="/memberEditCheck", method=RequestMethod.POST)
	public ModelAndView memberEditCheck(String userpwd, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		String userid=(String)session.getAttribute("logId");
		int result=service.memberPwdSelect(userid, userpwd);
		
		if(result>0) { // 비밀번호 OK
			System.out.println("비밀번호 맞음");
			mav.setViewName("redirect:memberEditForm");
		}else { // 비밀번호를 잘못 입력한 경우
			System.out.println("비밀번호 틀림");
			mav.addObject("notPwd", "1");
			mav.setViewName("member/memberEdit");
		}
		
		return mav;
	}
	@RequestMapping("/memberEditForm")
	public ModelAndView memberEditForm(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		String arr1[] = {"010"," 02"," 031","032"," 033"," 041"," 042"," 043"," 044"," 051"," 052"," 053"," 054"," 055"," 061"," 062"," 063"," 064"};
		String guArr[]= {"강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구"
				,"동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"};
		
		String userid=(String)session.getAttribute("logId");
		mav.addObject("arr1", arr1);
		mav.addObject("guArr", guArr);
		
		
		MemberVO vo=new MemberVO();
		vo=service.memberSelect(userid);
		
		mav.addObject("vo", service.memberSelect(userid));
		mav.setViewName("member/memberEditForm");
		
		return mav;
	}
	
	@RequestMapping(value="/memberEditOk", method=RequestMethod.POST)
	public ModelAndView memberEditOk(MemberVO vo, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		vo.setUserid((String)session.getAttribute("logId"));
		
		int pwdResult=service.memberPwdSelect(vo.getUserid(), vo.getUserpwd());
		
		System.out.println("아이디 : "+vo.getUserid());
		System.out.println("비밀번호 : "+vo.getUserpwd());
		System.out.println("연락처 전체 : "+vo.getTel());
		System.out.println("희망지역 전체1 : "+vo.getArea());
		System.out.println("희망1 : "+vo.getArea1());
		System.out.println("희망2 : "+vo.getArea2());
		System.out.println("희망3 : "+vo.getArea3());
		System.out.println("이메일 전체 : "+vo.getEmail());
		System.out.println("이메일 아이디 : "+vo.getEmailid());
		System.out.println("이메일 도메인 : "+vo.getEmaildomain());
		
		if(pwdResult==1) {
			
		}else if(pwdResult==0) {
			System.out.println("비밀번호를 바꾸는 경우");
			if(service.memberUpdatePwdY(vo)>0) { // 비밀번호 포함 변경 성공
				System.out.println("비밀번호 포함 변경 성공");
			}else { // 비밀번호 포함 변경 실패
				System.out.println("비밀번호 포함 변경 실패");
			}
		}else if(vo.getUserpwd()==""){
			System.out.println("비밀번호를 바꾸지 않는 경우");
			System.out.println("second:"+vo.getArea());
			if(service.memberUpdatePwdN(vo)>0) { // 비밀번호 미포함 변경 성공
				System.out.println("비밀번호 미포함 변경 성공");
			}else { // 비밀번호 미포함 변경 실패
				System.out.println("비밀번호 미포함 변경 실패");
			}
		}
		
		mav.setViewName("redirect:memberEditForm");
		return mav;
	}
	
	@RequestMapping("/memberExit")
	public String memberExit() {
		
		return "member/memberExit";
	}
	
	@RequestMapping("/memberExitOk")
	public ModelAndView memberExitOk(String userpwd, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		String userid=(String)session.getAttribute("logId");
		
		int result=service.memberPwdSelect(userid, userpwd);
		
		if(result>0) { // 비밀번호가 일치하는 경우
			System.out.println("일치하는 경우");
			service.memberExit(userid, userpwd);
			mav.setViewName("home");
		}else { // 비밀번호가 일치하지 않는 경우
			System.out.println("일치하지않는 경우");
			mav.setViewName("member/memberExit");
		}
		
		return mav;
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
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("/memberFind")
	public String memberFind() {
		return "member/memberFind";
	}
	
	@RequestMapping(value="/memberFindId", method=RequestMethod.POST)
	public ModelAndView memberFindId(MemberVO vo) {
		ModelAndView mav=new ModelAndView();
		
		String result=service.memberFindId(vo);
		
		if(result!=null) { // 입력한 정보에 맞는 아이디가 있는 경우
			mav.addObject("findId", result);
		}else { // 입력한 정보에 맞는 아이디가 없는 경우
			mav.addObject("findNotId", "no");
		}
		
		mav.setViewName("member/memberFind");
		return mav;
	}
	
	@RequestMapping("/sample")
	public String sample() {
		return "member/sample";
	}
}
