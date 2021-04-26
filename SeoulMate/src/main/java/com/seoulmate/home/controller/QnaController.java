package com.seoulmate.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.seoulmate.home.service.QnaService;
@Controller
public class QnaController {
	@Inject
	QnaService service;
	
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
