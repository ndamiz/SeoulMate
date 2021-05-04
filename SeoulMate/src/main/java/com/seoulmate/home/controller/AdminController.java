package com.seoulmate.home.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.AdminService;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PagingVO;
import com.seoulmate.home.vo.PayVO;

@Controller
public class AdminController {
	@Inject
	AdminService service;
	
	
	//admin에 들어오면 나오는 대시보드
	@RequestMapping("/admin")
	public String adminDashboard() {
		return "/admin/adminDashboard";
	}
	//신고관리
	@RequestMapping("/admin/reportManagement")
	public String adminReport() {
		//DB에서 데이터 조회
		
		//페이징
		
		return "/admin/reportManagement";
	}
	///////////////////////////////////////////////////////
	//관리자-회원
	@RequestMapping(value="/admin/memberManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memberManagement(PagingVO pVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		pVO.setTotalRecode(service.membertotalRecord(pVO));
		System.out.println("검색키 : "+pVO.getSearchKey());
		System.out.println("검색어 : "+pVO.getSearchWord());
		System.out.println("등급 : "+pVO.getGrade());
		System.out.println("상태 : "+pVO.getState());
		System.out.println("총 레코드 : "+pVO.getTotalRecode());
		
		mav.addObject("list", service.memberSelect(pVO));
		mav.setViewName("admin/memberManagement");
		return mav;
	}
	
	@RequestMapping("/admin/memberInfo")
	@ResponseBody
	public MemberVO memberInfo(String userid) {
		MemberVO vo=service.memberInfo(userid);
		
		return vo;
	}
	
	@RequestMapping(value="/admin/memInfoSave", method=RequestMethod.POST)
	public ModelAndView memInfoSave(MemberVO vo, HttpSession session, HttpServletRequest req) {
		ModelAndView mav=new ModelAndView();
		String path=session.getServletContext().getRealPath("/profilePic");
		String selFilename=service.memberProfile(vo.getUserid());
		String delFilename=req.getParameter("delFile"); // 프로필을 변경할 때 기존 파일명이 delFile로 들어온다.
		
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)req;
		MultipartFile newName=mr.getFile("filename");
		String newUpload="";
		
		if(newUpload!=null && newName!=null) {
			String orgname=newName.getOriginalFilename(); // 수정할 파일명
			
			if(orgname!=null && !orgname.equals("")) {
				File ff=new File(path, orgname);
				int i=1;
				while(ff.exists()) {
					int pnt=orgname.lastIndexOf(".");
					String firstName=orgname.substring(0, pnt);
					String extName=orgname.substring(pnt+1);
					
					ff=new File(path, firstName+"_"+ i++ +"."+extName);
				}
				try {
					newName.transferTo(ff);
				}catch(Exception e) {
					System.out.println("새로운 파일 추가 수정 에러 발생");
					e.printStackTrace();
				}
				newUpload=ff.getName();
				vo.setProfilePic(newUpload);
			}else {
				vo.setProfilePic(selFilename);
			}
			int result=service.memberInfoSave(vo);
			
			if(result>0) { // 회원정보 수정에 성공한 경우
				mav.setViewName("redirect:memberManagement");
				if(orgname!="" && orgname!=null) {
					try {
						File dFileObj=new File(path, delFilename);
						dFileObj.delete();
					}catch(Exception e) {
						System.out.println("글 수정 중 삭제할 파일 삭제 에러 발생");
						e.printStackTrace();
					}
				}else {
					try {
						File dFileObj=new File(path, newUpload);
						dFileObj.delete();
					}catch(Exception e) {
						System.out.println("글 수정 중 삭제할 파일 삭제 에러 발생");
						e.printStackTrace();
					}
				}
			}else { // 회원정보 수정에 실패한 경우
				if(orgname=="") {
					try {
						File dFileObj=new File(path, newUpload);
						dFileObj.delete();
					}catch(Exception e) {
						System.out.println("글 수정 중 삭제할 파일 삭제 에러 발생");
						e.printStackTrace();
					}
				}else {
					try {
						File dFileObj=new File(path, delFilename);
						dFileObj.delete();
					}catch(Exception e) {
						System.out.println("글 수정 중 삭제할 파일 삭제 에러 발생");
						e.printStackTrace();
					}
				}
				mav.setViewName("redirect:memberManagement");
			}
		}
		
		mav.setViewName("redirect:memberManagement");
		return mav;
	}
	///////////////////////////////////////////////////////
	
	//관리자 - 쉐어하우스 
	@RequestMapping(value="/admin/houseManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView houseManagement() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("admin/houseManagement");
		return mav;
	}
	//관리자 - 하우스메이트 
	@RequestMapping(value="/admin/mateManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mateManagement() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("admin/mateManagement");
		return mav;
	}
	
	//관리자 - 결제 
	@RequestMapping(value="/admin/payManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView payManagement(PayVO payVO) {
		ModelAndView mav = new ModelAndView();
		
		// 1.페이지번호 
		System.out.println(payVO.getNowPageNum());
		// 2. 검색어 검색키 
		System.out.println(payVO.getSearchKey());
		System.out.println(payVO.getSearchWord());
		// 3. 년별, 월별, 일별
		System.out.println(payVO.getSelectYearMonthDate());
		System.out.println(payVO.getSelectStartDate());
		System.out.println(payVO.getSelectEndDate());
		
		// 1.총 레코드 구하기  
		payVO.setTotalRecode(service.totalRecode(payVO));
		System.out.println("service.totalRecode(payVO)= " + payVO.getTotalRecode());
			//자동계산 (토탈페이지, 라스트페이지 레코드) 
		System.out.println("토탈페이지 = " +payVO.getTotalPage());
		System.out.println("라스트페이지레코드" +payVO.getLastPageRecode());
		
		// 2. 한페이지 레코드 구하기 
		
		mav.setViewName("admin/payManagement");
		return mav;
	}
	//관리자 - 매출
	@RequestMapping(value="/admin/salesManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView salesManagement() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("admin/salesManagement");
		return mav;
	}
	//문의 관리
	@RequestMapping("/admin/contactManagement")
	public String contactManagement() {
		return "/admin/contactManagement";
	}
}
