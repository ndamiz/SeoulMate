package com.seoulmate.home.controller;

import java.io.File;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.ResultMap;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.seoulmate.home.service.AdminService;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PagingVO;
import com.seoulmate.home.vo.PayVO;
import com.seoulmate.home.vo.ReportVO;

@Controller
public class AdminController {
	@Inject
	AdminService service;
	
	
	//admin에 들어오면 나오는 대시보드
	@RequestMapping("/admin")
	public String adminDashboard() {
		return "/admin/adminDashboard";
	}
	///////////////////////신고관리////////////////////
	//신고 등록
	@RequestMapping("/reportInsert")
	@ResponseBody
	public String reportInsert(ReportVO reportVO) {
		service.reportInsert(reportVO);
		return "신고등록 성공";
	}
	//신고 목록 불러오기
	@RequestMapping(value="/admin/reportManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminReport() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("report", service.reportTotalRecord());
		mav.setViewName("admin/reportManagement");
		return mav;
	}
	//신고 상세보기
	@RequestMapping("/admin/reportDetailInfo")
	@ResponseBody
	public ReportVO reportDetailInfo(int num) {
		ReportVO reportVO = service.reportInfo(num);
		
		return reportVO;
	}
	//TEST 자동 완성==============================================================================
	@RequestMapping(value="/admin/json", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String json(Locale locale, Model model, String keyword) {
		String[] array = service.reportCategorySelect(keyword);
		
		Gson gson = new Gson();
		
		return gson.toJson(array);
	}
	//신고 처리하기
	@RequestMapping(value="/admin/reportAdmin")
	@ResponseBody
	public String reportAdmin(ReportVO reportVO, boolean visibility, boolean blacklist) {
		String result = "";
	
		if(visibility && reportVO.getState().equals("처리완료")) {//게시글 공개 상태가 true면 당연히 state는 처리완료.
			
			//트랜잭션이 필요!!!
			service.allStateUdate(reportVO.getNo(), reportVO.getUserid(), reportVO.getCategory());
			service.reportStateUpdate(reportVO.getNum(), reportVO.getState());

			int reportNum = service.checkReportCnt(reportVO.getUserid()); // 누적 신고수 확인
			//5개 이상이면 블랙리스트 추가
			if(reportNum>=5) {
				service.addBlacklist(reportVO.getUserid());
				result += "blacklist Added / ";
			}
			
			result += "visibility done";
		}else if(reportVO.getState().equals("허위신고")) { // 허위신고 처리
			
			service.reportStateUpdate(reportVO.getNum(), reportVO.getState());
			
			//신고처리 되었는데 알고보니 허위신고일때..? -> 게시글은 그냥 상태를 모집중/공개로 바꾸지만 댓글은 content를 업데이트하는건데.. 그럼 삭제전 댓글 내용 필드 추가해야하나...?
			
			result = "false report";
		}
		//블랙리스트 상태가 true면 해당 회원 블랙리스트 추가
		if(blacklist) {
			service.addBlacklist(reportVO.getUserid());
		}
		
		return result;
	}
	///////////////////////////////////////////////////////
	//관리자-회원
	@RequestMapping(value="/admin/memberManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memberManagement(PagingVO pVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		pVO.setTotalRecode(service.membertotalRecord(pVO));

		mav.addObject("list", service.memberSelect(pVO));
		mav.addObject("pVO", pVO);
		
		System.out.println("전체 페이지 : "+pVO.getTotalPage());
		System.out.println("전체 레코드 수 : "+pVO.getTotalRecode());
		System.out.println("시작 페이지 : "+pVO.getStartPageNum());
		System.out.println("현재 페이지 : "+pVO.getPageNum());
		System.out.println("페이징 개수 : "+pVO.getOnePageNum());
		System.out.println("마지막 페이지 레코드 수 : "+pVO.getLastPageRecode());
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
	public ModelAndView houseManagement(HouseWriteVO hwVO, PagingVO pagingVO) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hwVO", hwVO);
		map.put("pagingVO", pagingVO);
		// 조건에 맞는 총 레코드 수 구하기. 
		pagingVO.setTotalRecode(service.houseTotalRecode(map));
		//2. 한페이지에 들어가는 레코드 수 구하기 
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("hwVO", hwVO);
		map1.put("pagingVO", pagingVO);
		
		mav.addObject("houseWriteList", service.houseOnePageListSelect(map1));
		mav.addObject("hwVO", hwVO);
		mav.addObject("pagingVO", pagingVO);
		
		mav.setViewName("admin/houseManagement");
		return mav;
	}
	
	@RequestMapping("/admin/houseDetailInfo")
	@ResponseBody
	public Map<String, Object> houseDetailInfo(@RequestParam(value="no") int no, @RequestParam(value="userid") String userid,
													@RequestParam(value="housename") String housename) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		HouseWriteVO hwVO = new HouseWriteVO();
		hwVO.setNo(no);
		hwVO.setUserid(userid);
		hwVO.setHousename(housename);
		
		
		
		return resultMap;
	}
	//관리자 - 하우스메이트 
	@RequestMapping(value="/admin/mateManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mateManagement(MateWriteVO mwVO, PagingVO pagingVO) {
		ModelAndView mav = new ModelAndView();
		
		// 조건에 맞는 총 레코드 수. 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mwVO", mwVO);
		map.put("pagingVO", pagingVO);
		pagingVO.setTotalRecode(service.mateTotalRecode(map));
		
		//2. 한페이지에 들어가는 레코드
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("mwVO", mwVO);
		map1.put("pagingVO", pagingVO);
		
		mav.addObject("mateWriteList", service.mateOnePageListSelect(map1));
		mav.addObject("mwVO", mwVO);
		mav.addObject("pagingVO", pagingVO);
		
		mav.setViewName("admin/mateManagement");
		return mav;
	}
	
	//관리자 - 결제 
	@RequestMapping(value="/admin/payManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView payManagement(PayVO payVO, PagingVO pagingVO) {
		ModelAndView mav = new ModelAndView();
		// 1.총 레코드 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("payVO", payVO);
		map.put("pagingVO", pagingVO);
		pagingVO.setTotalRecode(service.payTotalRecode(map));
		// 2. 한페이지 레코드 구하기 
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("payVO", payVO);
		map1.put("pagingVO", pagingVO);
		
		mav.addObject("payList", service.payOnePageListSelect(map1));
		mav.addObject("payVO", payVO);
		mav.addObject("pagingVO", pagingVO);
		mav.setViewName("admin/payManagement");
		return mav;
	}		
	@RequestMapping(value="/admin/payManagementList", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> payManagementList(PayVO payVO, PagingVO pagingVO){
		Map<String, Object> returnMap = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("payVO", payVO);
		map.put("pagingVO", pagingVO);
		pagingVO.setTotalRecode(service.payTotalRecode(map));
		// 2. 한페이지 레코드 구하기 
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("payVO", payVO);
		map1.put("pagingVO", pagingVO);
		
		List<PayVO> payVO_1 = service.payOnePageListSelect(map1);
		returnMap.put("payVO", payVO_1);
		returnMap.put("pagingVO", pagingVO);
		
		return returnMap;
	}
	//관리자 - 매출
		@RequestMapping(value="/admin/salesManagement", method={RequestMethod.POST, RequestMethod.GET})
		public ModelAndView salesManagement(PayVO payVO, PagingVO pagingVO) {
			ModelAndView mav = new ModelAndView();
			//기본정렬 payStart로 세팅.
			payVO.setOrderCondition("payStart"); 
			// 1.총 레코드 구하기  
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("payVO", payVO);
			map.put("pagingVO", pagingVO);
			pagingVO.setTotalRecode(service.payTotalRecode(map));
			// 2. 한페이지 레코드 
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("payVO", payVO);
			map1.put("pagingVO", pagingVO);
			mav.addObject("salesList", service.salesOnePageListSelect(map1));
			
			// 3. 조건에 맞는 레코드의 총 합계 구하기
			mav.addObject("totalVO", service.salesTotalAmountSelect(payVO));
			mav.addObject("payVO", payVO);
			mav.addObject("pagingVO", pagingVO);
			mav.setViewName("admin/salesManagement");
			return mav;
		}		
		
		@RequestMapping(value="/admin/salesManagementList", method={RequestMethod.POST, RequestMethod.GET})
		@ResponseBody
		public Map<String, Object> salesManagementList(PayVO payVO, PagingVO pagingVO){
			Map<String, Object> returnMap = new HashMap<String, Object>();
			// 1.총 레코드 구하기  
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("payVO", payVO);
			map.put("pagingVO", pagingVO);
			pagingVO.setTotalRecode(service.payTotalRecode(map));
			// 2. 한페이지 레코드 
			Map<String, Object> map1 = new HashMap<String, Object>();
			map1.put("payVO", payVO);
			map1.put("pagingVO", pagingVO);
			List<PayVO> payList  = service.salesOnePageListSelect(map1);
			// 3. 조건에 맞는 레코드의 총 합계 구하기
			PayVO payVO_total = new PayVO();
			payVO_total = service.salesTotalAmountSelect(payVO);
			
			returnMap.put("pagingVO", pagingVO);
			returnMap.put("payList", payList);
			returnMap.put("total", payVO_total);
			
			return returnMap;
		}
	//문의 관리
	@RequestMapping("/admin/contactManagement")
	public String contactManagement() {
		return "/admin/contactManagement";
	}
}
