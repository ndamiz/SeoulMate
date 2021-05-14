package com.seoulmate.home.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.AdminService;
import com.seoulmate.home.service.BoardService;
import com.seoulmate.home.vo.BoardVO;
import com.seoulmate.home.vo.PageVO;

@Controller
public class BoardController {
	@Inject
	BoardService service;
	
	@Inject
	AdminService aService;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	//커뮤니티 페이지로 이동하기
	@RequestMapping("/communityList")
	public ModelAndView communityList(String category, PageVO pVo, HttpServletRequest req) {
		
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
		
//		//확인용
//		System.out.println("================================category=>"+pVo.getCategory());
//		System.out.println(pVo.getSearchKey()+"<----key+word------>"+pVo.getSearchWord());
//		System.out.println(pVo.getTotalRecord()+"//////////////totalRecord");
//		System.out.println(pVo.getTotalPage()+"**********************************totalPage");
//		///////
		
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
	public ModelAndView boardView(int no, HttpServletRequest req) {
		//조회수 올리기
		service.hitUpdate(no);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo", service.boardSelect(no));
		mav.addObject("replyCnt", service.replyCount(no));
		//관리자 접근일때
		if(req.getParameter("reply") != null) {
			System.out.println(req.getParameter("reply")+"댓글번호");
			mav.addObject("reply", req.getParameter("reply"));
		}else {
			System.out.println(req.getParameter("reply")+"댓글번호");
			mav.addObject("reply", "0");
		}
		mav.setViewName("/board/communityView");
		return mav;
	}
	//글 수정하기
	@RequestMapping("/communityEdit")
	public ModelAndView communityEdit(int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.boardSelect(no));
		mav.setViewName("/board/communityEdit");
		return mav;
	}
	//글 수정 update
	@RequestMapping("/communityEditOk")
	public ModelAndView communityEditOk(BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		System.out.println(vo.getCategory()+"category");
		System.out.println(vo.getSubject()+"subject");
		System.out.println(vo.getNo()+"글번호");
		int updateCnt = service.communityEdit(vo);
		if(updateCnt>0) {
			mav.setViewName("redirect:communityList");
		}else {
			mav.addObject("no", vo.getNo());
			mav.setViewName("redirect:communitEdit");
		}
		return mav;
	}
	
	//글 삭제하기
	@RequestMapping("/communityDel")
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView communitDel(int no, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		//트랜잭션
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // 트랜잭션 호출
		TransactionStatus status = transactionManager.getTransaction(def); 
		
		try {
			if(service.communityDelete(no,(String)session.getAttribute("logId"))>0) {
				//신고테이블에 있는 먼저 조회한다
				String reportNum = aService.getNumFromReport(no);
				System.out.println(reportNum+"????????????????????");
				if(reportNum!=null) {
					//글이 삭제되면 신고 테이블에서 상태 '삭제됨'으로 업데이트
					aService.reportStateUpdate(Integer.parseInt(reportNum), "삭제됨");
				}
				transactionManager.commit(status);
				mav.setViewName("redirect:communityList");
			}else {
				mav.addObject("no", no);
				mav.setViewName("redirect:communityView");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("글살제 트랜잭션 발생...");
			mav.addObject("no", no);
			mav.setViewName("redirect:communityView");
		}
		return mav;
	}
}