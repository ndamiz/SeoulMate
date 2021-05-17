package com.seoulmate.home.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.MypageService;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.LikeMarkVO;
import com.seoulmate.home.vo.MateWriteVO;
@Controller
public class MypageController {
	@Inject
	MypageService service;
	
	//마이페이지 하우스&메이트 관리 
	@RequestMapping("/myHouseAndMateList")
	public ModelAndView myHouseAndMateList(HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		//기본 하우스로 세팅.
		String msg = "";
		msg = (String)req.getAttribute("msg");
		
		//1. 세션아이디, 등급(일반 /프리미엄) 
		String userid = (String)session.getAttribute("logId");
		List<HouseWriteVO> hwList = new ArrayList<HouseWriteVO>();
		//1. 하우스로 등록된 성향으로 작성된 글이 있는지 확인.
		if( service.houseConfirm(userid)>0) {
			//1개이상 작성된 글이 있는 경우. 
			//1-1. 후 목록 가져오기 (모집중이 아닌것도 모두 가져온다,) 
			hwList = service.myPageHouseWriteSelect(userid);
			mav.addObject("hwList", hwList);
			if(msg==null || msg.equals("")) {
				msg = "house";
			}
		}
		
		//2. 메이트로 등록된 성향+글이 있는지 확인. 
		MateWriteVO mwVO = new MateWriteVO();
		if(service.mateConfirm(userid)>0) {
			//2-1. 후 목록 가져오기
			mwVO= service.myPageMateWriteSelect(userid);
			mav.addObject("mwVO", mwVO);
			// 하우스 글이 없을 경우엔 mate로 메세지 변경.
			if(msg==null || msg.equals("")) {
				msg = "mate";
			}
		}
		//3, likemark가 있는 지 확인. 
		if(service.likeMarkConfirm(userid)>0) {
			//3. likemark List 확인. (lno, no, category(하우스 or 메이트) 
			 List<LikeMarkVO> lmConfirm = service.likeMarkSelect(userid);
			int no=0;
			String category = "";
			if(lmConfirm.size()>0) {
				for(int i=0; i<lmConfirm.size(); i++) {
					no = lmConfirm.get(i).getNo();
					category = lmConfirm.get(i).getCategory();
					if(category.equals("하우스")){
						// 하우스일경우엔 houseWriteVO 를 넣는다. 
						List<HouseWriteVO> houseLikeList = new ArrayList<HouseWriteVO>();
						//하우스를 찜 했을 경우. 
						houseLikeList.add(service.houseLikeSelect(no));
						mav.addObject("houseLikeList", houseLikeList);
					}else if(category.equals("메이트")){
						// 메이트글 일경우엔 mateWriteVO를 넣는다.
						List<MateWriteVO> mateLikeList = new ArrayList<MateWriteVO>();
						//메이트를 찜 했을 경우
						mateLikeList.add(service.mateLikeSelect(no));
						mav.addObject("mateLikeList", mateLikeList);
					}
				}
			}	
		}  
		if(msg==null || msg.equals("")) {
			msg = "house";
		}
		mav.addObject("msg", msg);
		mav.setViewName("mypage/myHouseAndMateList");
		return mav;
	}
	
	//마이페이지 찜목록
	@RequestMapping("/likeMarkerList")
	public ModelAndView likeMarkerList() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("mypage/likeMarkerList");
		return mav;
	}
	//마이페이지 결제내역 확인 페이지
	@RequestMapping("/payDetailList")
	public ModelAndView payDetailList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/payDetailList");
		return mav;
	}
}
