package com.seoulmate.home.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.BoardService;
import com.seoulmate.home.vo.BoardPageVO;
import com.seoulmate.home.vo.BoardVO;

@Controller
public class BoardController {
	@Inject
	BoardService service;
	
	//커뮤니티 페이지로 이동하기
	@RequestMapping("/communityList")
	public ModelAndView communityList(String category, String searchKey, String searchWord, BoardPageVO vo) {
		
		//커뮤니티 게시판에서 카테고리 필터를 누를때 필요한 부분///////
		System.out.println("===>"+category);
		System.out.println("searchKey.*******>"+searchKey);
		System.out.println("VOsearchKey.*******>"+vo.getSearchKey());
		System.out.println("searchWord////////////>"+searchWord);
		System.out.println("VOsearchWord////////////>"+vo.getSearchWord());
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.comAllRecord(category));
		mav.addObject("category", category);
		mav.setViewName("/board/communityList");
		return mav;
	}
	
	//커뮤니티에 글쓰기버튼 클릭시
	@RequestMapping("/communityWrite")
	public String communityWrite() {
		return "/board/communityWrite";
	}
	
	//글쓰기 폼에서 글쓰기 클릭 -> 글 등록
	@RequestMapping(value="/communityWriteOk", method=RequestMethod.POST)
	public ModelAndView communityWriteOk(BoardVO vo, HttpServletRequest req) {
		//사용자 아이디
		//vo.setUserid((String)req.getSession().getAttribute("logId"));
		vo.setUserid("yunyun");
		//등록자 아이피 주소
		vo.setIp(req.getRemoteAddr());
		
		//dao에서 글등록 메소드 호출
		int result = service.boardInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {//글 등록 성공
			mav.setViewName("redirect:communityList");//커뮤니티 글 목록으로
		}else {
			mav.setViewName("redirect:communityWrite");//글 작성 폼으로
		}
		return mav;
	}
	//////////////////////////////////찜하기->멤버나 마이페이지로 이동해야함
	@RequestMapping("/memberLike")
	public String memberLike() {
		return "/board/memberLike";
	}
	
}