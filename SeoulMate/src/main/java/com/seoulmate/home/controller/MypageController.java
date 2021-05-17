package com.seoulmate.home.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.MypageService;
import com.seoulmate.home.vo.HouseRoomVO;
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
	public ModelAndView likeMarkerList(String category, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = ((String)session.getAttribute("logId"));
		System.out.println(category+"@@@@@@@@");
		if(category==null) { //찜 목록에 처음 들어올때는 카테고리가 없다. 그래서 기본 화면인 하우스로 세팅
			category = "하우스";
		}
		int check = 0;
		List<LikeMarkVO> likedNumCategory = service.likemarkAllRecord(category, userid); //찜 테이블에서 사용자 아이디와 카테고리로 조회해서 원글번호, 카테고리를 가져온다.
		List<HouseWriteVO> house = new ArrayList<HouseWriteVO>();
		List<MateWriteVO> mate = new ArrayList<MateWriteVO>();
		if(likedNumCategory.size() != 0) { // 레코드가 없을 경우 조건문이 실행되지 않고 찜목록으로 넘어간다.
			if((likedNumCategory.get(0).getCategory()).equals("하우스")) {
				
				for(int i=0; i<likedNumCategory.size(); i++) {
					System.out.println("%%%%%");
					HouseWriteVO hVO = service.getHousedetails(likedNumCategory.get(i).getNo());
					HouseRoomVO rVO = service.getMinRentDeposit(likedNumCategory.get(i).getNo());
					hVO.setRent(rVO.getRent());
					hVO.setDeposit(rVO.getDeposit());
					house.add(hVO);
					System.out.println(house.get(i).getDeposit()+"만원");
				}
				check = 1;
				System.out.println("????1212!!!@##="+check);
			}else if((likedNumCategory.get(0).getCategory()).equals("메이트")) {
				
				for(int i=0; i<likedNumCategory.size(); i++) {
					mate.add((MateWriteVO) service.getMatedetails(likedNumCategory.get(i).getNo()));
				}
				
				check = 2;
				System.out.println("????1212!!!@##="+check);
			}
		}
		if(check==1) {
			mav.addObject("house", house);
		}else if(check==2) {
			mav.addObject("mate", mate);
		}
		mav.addObject("check", check);
		mav.setViewName("mypage/likeMarkerList");
		return mav;
	}
	//찜 등록
	@RequestMapping("/likemarkInsert")
	@ResponseBody
	public int likemarkInsert(int no, String userid, String category) {
		return service.likemarkInsert(no, userid, category);
	}
	//마이페이지 결제내역 확인 페이지
	@RequestMapping("/payDetailList")
	public ModelAndView payDetailList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("mypage/payDetailList");
		return mav;
	}
}
