package com.seoulmate.home.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.seoulmate.home.service.CommunityReplyService;
import com.seoulmate.home.vo.CommunityReplyVO;

@Controller
public class CommunityReplyController {
	@Inject
	CommunityReplyService service;
	
	//댓글 목록 불러오기 ajax
	@RequestMapping("/replyList")
	@ResponseBody
	public List<CommunityReplyVO> replyList(int no){
		return service.replyList(no);
	}
	//댓글 등록하기 
	@RequestMapping("/replyWriteOk")
	@ResponseBody
	public String replyInsert(CommunityReplyVO vo, HttpServletRequest req) {
		String result = "";
		vo.setUserid((String)req.getSession().getAttribute("logId"));
		vo.setIp(req.getRemoteAddr());
		
		int replyCnt = service.replyInsert(vo);
		return result = replyCnt+"개 댓글 등록 성공";
	}
}
