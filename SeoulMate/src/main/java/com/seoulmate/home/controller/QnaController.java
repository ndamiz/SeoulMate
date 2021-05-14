package com.seoulmate.home.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.QnaService;
import com.seoulmate.home.vo.ContactVO;
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
		
		//문의 등록
		@RequestMapping(value="/contactInsert", method = RequestMethod.POST)
		public ModelAndView contactInsert(ContactVO cVO) {
			ModelAndView mav = new ModelAndView();
			int contactInsertResult = service.contactInsert(cVO);
			if(contactInsertResult==1) {
				mav.addObject("result", contactInsertResult);
				mav.setViewName("/faq/contact");
			}else {
				mav.addObject("result", 0);
				mav.setViewName("/faq/contact");
			}
			return mav;
		}
}
