package com.seoulmate.home.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
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
	public ModelAndView myHouseAndMateList() {
		ModelAndView mav = new ModelAndView();
		
		
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
