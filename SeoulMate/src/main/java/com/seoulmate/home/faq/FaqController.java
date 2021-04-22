package com.seoulmate.home.faq;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FaqController {
	
	//자주하는 질문 게시판
	@RequestMapping("/qna")
	public String faqList() {
		return "/faq/qna";
	}
	
	//문의하기
	@RequestMapping("/contact")
	public String inquiry() {
		return "/faq/contact";
	}
}
