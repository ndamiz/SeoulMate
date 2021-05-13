package com.seoulmate.home.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
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
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PagingVO;
import com.seoulmate.home.vo.PayVO;
import com.seoulmate.home.vo.PropensityVO;
import com.seoulmate.home.vo.ReportVO;

@Controller
public class AdminController {
	@Inject
	AdminService service;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;


	// 관리자-로그인
	@RequestMapping("/admin/login")
	public String adminLogin() {
		return "/admin/adminLogin";
	}
	
	//admin에 들어오면 나오는 대시보드
	@RequestMapping("/admin")
	public String adminDashboard() {
		return "/admin/adminDashboard";
	}
	
	@RequestMapping(value="/admin/loginOk", method = RequestMethod.POST)
	public ModelAndView adminLoginOk(String userid, String userpwd, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		Calendar now=Calendar.getInstance(); // 현재 시간 구하기
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm 접속"); // 날짜 포맷
		String loginTime=format.format(now.getTime());
		
		if(userid.equals("seoulmate") && userpwd.equals("qwer1234!")) {
			System.out.println("어드민 로그인 성공");
			session.setAttribute("adminStatus", "Y");
			session.setAttribute("loginTime", loginTime);
			mav.setViewName("/admin/adminDashboard");
		}else {
			System.out.println("어드민 로그인 실패");
			mav.setViewName("redirect:/admin/login");
		}
		return mav;
	}
	@RequestMapping("/admin/logoutOk")
	public String adminLogoutOk(HttpSession session) {
		session.removeAttribute("adminStatus");
		session.removeAttribute("loginTime");
		
		return "/admin/adminLogin";
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
		//reportVO.setvState(service.)
		
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
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public String reportAdmin(ReportVO reportVO, boolean visibility, boolean blacklist) {
		String result = "";
		
		//트랜잭션
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // 트랜잭션 호출
		TransactionStatus status = transactionManager.getTransaction(def); 
		
		//게시글 공개 상태가 true면 당연히 state는 처리완료.
		if(visibility && reportVO.getState().equals("처리완료")) {
			
			try {
				service.allStateUdate(reportVO.getNo(), reportVO.getUserid(), reportVO.getCategory(), reportVO.getState()); //글 상태 비공개로 변경
				service.reportStateUpdate(reportVO.getNum(), reportVO.getState()); //신고관리목록에서 처리완료로 상태변경

				int reportNum = service.checkReportCnt(reportVO.getUserid()); // 누적 신고수 확인
				//5개 이상이면 블랙리스트 추가
				if(reportNum>=5) {
					service.addBlacklist(reportVO.getUserid());
					result += "blacklist+";
				}
				transactionManager.commit(status);
				result += "blocked";
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("신고하기 트랜잭션 1 - 처리완료 에러");
				result = "failed";
			}
		
		// 허위신고 처리
		}else if(reportVO.getState().equals("허위신고")) {
		
			try {
				service.allStateUdate(reportVO.getNo(), reportVO.getUserid(), reportVO.getCategory(), reportVO.getState()); //글 상태 공개로 다시 변경
				service.reportStateUpdate(reportVO.getNum(), reportVO.getState());
				transactionManager.commit(status);
				result = "false report";
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("신고하기 트랜잭션 2 - 허위신고 처리 에러");
				result = "false report failed";
			}
		}
		//블랙리스트 상태가 true면 해당 회원 블랙리스트 추가
		if(blacklist && reportVO.getState().equals("처리완료")) {
			System.out.println("????????????");
			service.addBlacklist(reportVO.getUserid());
		}
		
		return result;
	}
	///////////////////////////////////////////////////////
	//관리자-회원
	@RequestMapping(value="/admin/memberManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memberManagement(String state, String grade, PagingVO pVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		pVO.setTotalRecode(service.membertotalRecord(pVO));
		
		mav.addObject("state", state);
		mav.addObject("grade", grade);
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
	
	@RequestMapping(value="/admin/houseDetailInfo", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> houseDetailInfo(HttpServletRequest req) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int no = Integer.parseInt((String)req.getParameter("no"));
		String userid = req.getParameter("userid");
		
		HouseWriteVO hwVO = new HouseWriteVO();
		hwVO.setNo(no);
		hwVO.setUserid(userid);
		// houseWriteVO 의 정보 
		hwVO = service.houseDetailInfoSelect(hwVO);
		// housePropensityVO 의 정보
		int pno = hwVO.getPno();
		PropensityVO propenVO = service.propensitySelect(pno);
		// houseRoomVO 의 정보
		List<HouseRoomVO> hrVOList = service.houseRoomInfoSelect(hwVO);
		resultMap.put("hwVO", hwVO);
		resultMap.put("propenVO", propenVO);
		resultMap.put("hrVOList", hrVOList);
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
	//
	@RequestMapping(value="admin/mateDetailInfo", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> mateDetailInfo(HttpServletRequest req){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int no = Integer.parseInt((String)req.getParameter("no"));
		String userid = req.getParameter("userid");
		
		MateWriteVO mwVO = new MateWriteVO();
		mwVO.setNo(no);
		mwVO.setUserid(userid);
		// mate 정보 가져오기
		mwVO = service.mateDetailInfoSelectMateWrite(mwVO);
		int pno = mwVO.getPno();
		// mate PropensityVO 의 정보
		PropensityVO propenVO = service.propensitySelect(pno);
		// mate 의 member 정보
		MemberVO memVO = service.mateDetailInfoSelectMember(userid);
		resultMap.put("mwVO", mwVO);
		resultMap.put("propenVO", propenVO); 
		resultMap.put("memVO", memVO);
		
		return resultMap;
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
	
	@RequestMapping("/admin/adminPrintPage")
	public ModelAndView adminPrintPage(HttpServletRequest req, PagingVO pagingVO) {
		String msg = (String)req.getParameter("msg");
		
		ModelAndView mav =  new ModelAndView();
		System.out.println(msg);
		if(msg.equals("mateWrite")) {
			List<MateWriteVO> mwList = new ArrayList<MateWriteVO>();
			
			MateWriteVO mwVO = new MateWriteVO();
			mwVO.setMatestate((String)req.getParameter("matestate"));
			mwVO.setGrade(Integer.parseInt((String)req.getParameter("grade")));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mwVO", mwVO);
			map.put("pagingVO", pagingVO);
			
			mwList = service.mateListSelect(map);
			mav.addObject("mwList", mwList);
			mav.addObject("msg", "mate");
		}else if(msg.equals("houseWrite")) {
			List<HouseWriteVO> hwList = new ArrayList<HouseWriteVO>();
			
			HouseWriteVO hwVO = new HouseWriteVO();
			hwVO.setHousestate((String)req.getParameter("housestate"));
			hwVO.setGrade(Integer.parseInt((String)req.getParameter("grade")));
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("hwVO", hwVO);
			map.put("pagingVO", pagingVO);
			
			hwList = service.houseListSelect(map);
			
			mav.addObject("hwList", hwList);
			mav.addObject("msg", "house");
		}else if(msg.equals("pay") || msg.equals("sales")) {
			PayVO payVO = new PayVO();
			payVO.setSelectYearMonthDate((String)req.getParameter("selectYearMonthDate"));
			payVO.setSelectStartDate((String)req.getParameter("selectStartDate"));
			payVO.setSelectEndDate((String)req.getParameter("selectEndDate"));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("payVO", payVO);
			map.put("pagingVO", pagingVO);
			
			if(msg.equals("pay")) {
				List<PayVO> payList = new ArrayList<PayVO>();
				payList = service.payListSelect(map);
				mav.addObject("payList", payList);
				mav.addObject("msg", "pay");	
			}else if(msg.equals("sales")) {
				List<PayVO> salesList = new ArrayList<PayVO>();
				salesList = service.salesListSelect(map);
				PayVO payVO_total = new PayVO();
				payVO_total = service.salesTotalAmountSelect(payVO);
				mav.addObject("totalVO", payVO_total);
				mav.addObject("salesList", salesList);
				mav.addObject("msg", "sales");	
			}	
		}
		mav.setViewName("admin/adminPrintPage");
		return mav;
	}
	//메이트 출력용 리스트 가져오기 
		@RequestMapping(value="admin/mateManagementList", method= {RequestMethod.POST, RequestMethod.GET})
		@ResponseBody
		public List<MateWriteVO> mateManagementList(MateWriteVO mwVO, PagingVO pagingVO) {
			List<MateWriteVO> list = new ArrayList<MateWriteVO>();
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mwVO", mwVO);
			map.put("pagingVO", pagingVO);
			
			list = service.mateListSelect(map);
			return list;
		}
}
