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
		String arr1[] = {"010"," 02"," 031","032"," 033"," 041"," 042"," 043"," 044"," 051"," 052"," 053"," 054"," 055"," 061"," 062"," 063"," 064"};
		
		mav.addObject("arr1", arr1);
		mav.addObject("year", year);
		mav.setViewName("member/memberForm");
		
		return mav;
	}

	@RequestMapping("/login")
	public String loginForm() {
		return "member/login";
	}
	
	
	@RequestMapping(value="/loginOk", method = RequestMethod.POST)
	public ModelAndView loginCheck(String userid, String userpwd, HttpSession session) {
		MemberDAOImp dao = sqlSession.getMapper(MemberDAOImp.class);
		MemberVO logVO = dao.loginCheck(userid, userpwd);
		
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
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "home";
	}
	
	@RequestMapping("/memberFind")
    public String memberFind() {
        return "member/memberFind";
    }
	
	@RequestMapping(value="/memberFindId", method=RequestMethod.POST)
    public ModelAndView memberFindId(MemberVO vo) {
        ModelAndView mav=new ModelAndView();
        MemberDAOImp dao=sqlSession.getMapper(MemberDAOImp.class);

        String result=dao.memberFindId(vo);

        if(result!=null) { // 입력한 정보에 맞는 아이디가 있는 경우
            mav.addObject("findId", result);
        }else { // 입력한 정보에 맞는 아이디가 없는 경우
            mav.addObject("findNotId", "no");
        }

        mav.setViewName("member/memberFind");
        return mav;
    }
}
