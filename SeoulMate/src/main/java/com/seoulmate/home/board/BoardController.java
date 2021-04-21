package com.seoulmate.home.board;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Autowired
	SqlSession sqlSession;
	
	//커뮤니티 페이지로 이동하기
	@RequestMapping("/communityList")
	public ModelAndView communityList() {
		BoardDAOImp dao = sqlSession.getMapper(BoardDAOImp.class);
		
		//커뮤니티 게시판에서 카테고리 필터를 누를때 필요한 부분///////
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", dao.comAllRecord());
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
		BoardDAOImp dao = sqlSession.getMapper(BoardDAOImp.class);
		int result = dao.boardInsert(vo);
		
		ModelAndView mav = new ModelAndView();
		if(result>0) {//글 등록 성공
			mav.setViewName("redirect:communityList");//커뮤니티 글 목록으로
		}else {
			mav.setViewName("redirect:communityWirte");//글 작성 폼으로
		}
		return mav;
	}
	
}
