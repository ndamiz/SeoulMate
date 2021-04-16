package com.seoulmate.home.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	@RequestMapping("/memberForm")
	public String memForm() {
		return "member/memberForm";
	}
	
}
