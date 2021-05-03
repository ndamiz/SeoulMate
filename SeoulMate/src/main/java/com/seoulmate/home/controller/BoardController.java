package com.seoulmate.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.BoardService;
import com.seoulmate.home.vo.BoardVO;
import com.seoulmate.home.vo.PageVO;

@Controller
public class BoardController {
	@Inject
	BoardService service;
	
	//커뮤니티 페이지로 이동하기
	@RequestMapping("/communityList")
	public ModelAndView communityList(String category, BoardVO vo, PageVO pVo, HttpServletRequest req) {
		
		//리퀘스트돼서 오는 페이지번호가 있으면 세팅 없으면 기본값 1로 세팅
		String pageNumStr = req.getParameter("pageNum");
		if(pageNumStr != null) {
			pVo.setPageNum(Integer.parseInt(pageNumStr));
		}
		//넘어오는 카테고리가 있으면 세팅/ 이거 안해도 바로 세팅되는거같긴한데 일단 세팅!
		if(category == null) {
			pVo.setCategory("");
		}else {
			pVo.setCategory(category);
		}
		//검색어랑 카테고리필터에 따른 총 레코드 수 구하기
		pVo.setTotalRecord(service.totalRecord(pVo));
		
		//확인용
		System.out.println("================================category=>"+pVo.getCategory());
		System.out.println(pVo.getSearchKey()+"<----key+word------>"+pVo.getSearchWord());
		System.out.println(pVo.getTotalRecord()+"//////////////totalRecord");
		System.out.println(pVo.getTotalPage()+"**********************************totalPage");
		///////
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.comAllRecord(pVo));
		mav.addObject("category", category); //뷰에서 카테고리에 불들어오게 하기위해서 필요하다
		mav.addObject("pageVO", pVo); //뷰에서 페이징 세팅에 필요
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
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		//vo.setUserid("yunyun");
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
	
	//글 내용보기
	@RequestMapping("/communityView")
	public ModelAndView boardView(int no) {
		//조회수 올리기
		service.hitUpdate(no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.boardSelect(no));
		mav.addObject("replyCnt", service.replyCount(no));
		mav.setViewName("/board/communityView");
		return mav;
	}
	//글 삭제하기
	@RequestMapping("/communityDel")
	public ModelAndView communitDel(int no, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(service.communityDelete(no,(String)session.getAttribute("logId"))>0) {
			mav.setViewName("redirect:communityList");
		}else {
			mav.addObject("no", no);
			mav.setViewName("redirect:communityView");
		}
		return mav;
	}
}