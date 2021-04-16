package com.seoulmate.home.pay;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PremiumController {
	@Autowired
	SqlSession sqlSession;
	
	@RequestMapping("/premiumInfo")
	public String premiumInfo(HttpSession session) {
		
		return "premium/premiumInfo";
	}
}
