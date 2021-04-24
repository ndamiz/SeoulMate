package com.seoulmate.home;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView mav = new ModelAndView();
		HomeDAOImp dao = sqlSession.getMapper(HomeDAOImp.class);
		String[] lst = dao.getHouseMap();
		mav.addObject("lst",lst);

		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("/sample")
	public String sample() {
		return "sample";
	}
}
