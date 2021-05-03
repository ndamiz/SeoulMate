package com.seoulmate.home;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.HomeService;
import com.seoulmate.home.service.MemberService;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.MemberVO;

@Controller
public class HomeController {
	
	@Inject
	HomeService service;
	@Inject
	MemberService memberService;
	
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("chat/chatting");
		return mav;
	}
	
	@SuppressWarnings("null")
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 로그인전 하우스 맵 정보 구하기
		String[] houseMapList = service.getHouseMap();
		mav.addObject("houseMapList",houseMapList);
		
		// 로그인전 메이트 맵 정보 구하기
		String[] getMateList = service.getMateMap();
		String[] mateListArr = null;
		String[] mateMapList = null;
		String arr = "";
		
		for (int i = 0; i < getMateList.length; i++) {
			mateListArr = getMateList[i].split("/");
			for (String j : mateListArr) {
				arr += "'" + j + "',";
			}
		}
		mateMapList = arr.split(",");
		arr = Arrays.toString(mateMapList);
		mav.addObject("mateMapList",arr);
		
		//////////////////////////////////////////////////
		
		if(session.getAttribute("logId")!=null) {
			MemberVO memberVO = new MemberVO();
			memberVO = memberService.memberSelect((String)session.getAttribute("logId"));
			mav.addObject("memberVO", memberVO);
		}
		
		// 쉐어하우스 최신리스트 구하기
		List<HouseWriteVO> nhList = service.getNewHouse();
		
		for (HouseWriteVO hwVO : nhList) {
			// 각 쉐어하우스의 제일 저렴한 월세 가져오기
			HouseRoomVO hrVO = service.getDesposit(hwVO.getNo());
			hwVO.setDeposit(hrVO.getDeposit());
			hwVO.setRent(hrVO.getRent());
			int idx = hwVO.getAddr().indexOf("동 ");
			hwVO.setAddr(hwVO.getAddr().substring(0, idx+1));
		}
		
		mav.addObject("newHouseList", nhList);
		
		
		// 하우스메이트 최신리스트 구하기
		List<MateWriteVO> nmList = service.getNewMate();
	    Calendar cal = Calendar.getInstance();
        int y  = cal.get(Calendar.YEAR);
        int m = cal.get(Calendar.MONTH) + 1;
        int d   = cal.get(Calendar.DAY_OF_MONTH);
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        int today = Integer.parseInt(format.format(cal.getTime()));
		for (MateWriteVO mwVO : nmList) {
			// 각 하우스 메이트의 성별, 나이 구하기
			MemberVO mVO = service.getDetail(mwVO.getUserid());
			mwVO.setGender(mVO.getGender());
			 
			// 생년월일을 받아서 만 나이로 처리
			String b = mVO.getBirth();
			int i = b.indexOf(" 00");
			b = b.substring(0, i+1);
			String[] birth = b.split("-");
			int bYear = Integer.parseInt(birth[0]); 
			int bMonth = Integer.parseInt(birth[1]);
			int bDay = Integer.parseInt(birth[2].replace(" ",""));
			int age = (y - bYear); 
	        // 생일 안 지난 경우 -1
	        if (bMonth * 100 + bDay > m * 100 + d) {
	        	age--;
	        }
	        String BirthAge = age+"";
			mwVO.setBirth(BirthAge);
			
			// 입주 디데이 0일때 즉시 문자열 처리
			String e = mwVO.getEnterdate();
			System.out.println(e);
			int ee = e.indexOf(" ");
			e = e.substring(0, ee+1);
			e = e.replace(" ", "");
			int enterNum = Integer.parseInt(e.replace("-", ""));
			System.out.println((enterNum - today) + "일");
			String enterDay = "";
			if (enterNum - today > 0 && enterNum - today <=7) {
				enterDay = "즉시";
			}else {
				enterDay = (enterNum - today) + "일";
			}
			
			mwVO.setEnterdate(enterDay);
			
			// 희망지역 1~3 서울시 자르기
			int j = mwVO.getArea1().indexOf("구 ");
			mwVO.setArea(mwVO.getArea1().substring(j+1));
			if (mwVO.getArea2() != null) {
				j = mwVO.getArea2().indexOf("구 ");
				mwVO.setArea(mwVO.getArea2().substring(j+1));
			}
			if (mwVO.getArea3() != null) {
				j = mwVO.getArea3().indexOf("구 ");
				mwVO.setArea(mwVO.getArea3().substring(j+1));
			}
		}
		mav.addObject("newMateList", nmList);
		
		mav.setViewName("home");
		return mav;
	}
}
