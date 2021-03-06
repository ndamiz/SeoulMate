package com.seoulmate.home.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;

import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.seoulmate.home.service.AdminService;
import com.seoulmate.home.service.MemberService;
import com.seoulmate.home.vo.FaqVO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PagingVO;
import com.seoulmate.home.vo.PayVO;
import com.seoulmate.home.vo.PropensityVO;
import com.seoulmate.home.vo.ReportVO;

import jdk.nashorn.internal.parser.JSONParser;

import com.seoulmate.home.vo.ContactVO;

@Controller
public class AdminController {
	@Inject
	AdminService service;
	
	@Inject
	MemberService mService;
	
	@Inject
	JavaMailSenderImpl mailSender;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;

	// ?????????-?????????
	@RequestMapping("/admin/login")
	public String adminLogin() {
		return "/admin/adminLogin";
	}
	
	//admin??? ???????????? ????????? ????????????
	@RequestMapping("/admin")
	public ModelAndView adminDashboard() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("houseReport", service.todayReportNum("?????????"));
		mav.addObject("mateReport", service.todayReportNum("?????????"));
		mav.addObject("communityReport", service.todayReportNum("????????????"));
		mav.addObject("contactCnt", service.todayNum("??????"));
		mav.addObject("premiumCnt", service.todayNum("????????????"));
		mav.addObject("salesAmount", service.salesAmount());
		
		//chart
		String allGu[] = mService.gu();
//		String allGu[] = {"?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","?????????","????????????","?????????","?????????","????????????","?????????","?????????","?????????","?????????","?????????","????????????","?????????","?????????","??????","?????????"};
		HashMap<String, Integer> sortGu = new HashMap<String, Integer>();
		List<String> guName = new ArrayList<String>();
		List<Integer> guNum = new ArrayList<Integer>();
		//?????????
		for(int i=0;i <allGu.length; i++) {
			sortGu.put(allGu[i], service.getHouseAddr(allGu[i])); 
		}
//		System.out.println("===================================");
		//????????? ????????? ????????? ?????????
		Iterator iterator = sortByValue(sortGu).iterator();
		for(int i=0; i<5; i++) {
//		while(iterator.hasNext()) {
			String temp = (String)iterator.next();
//			System.out.println(temp + " = " + sortGu.get(temp));
			guName.add(temp);
			guNum.add(sortGu.get(temp));
		}
//		System.out.println("===================================");
//		System.out.println(guName.toString());
//		System.out.println(guNum.toString());
		
//		//?????????
//		String allarea[] = service.getMateArea();
//		System.out.println("===================================");
//		for(int i=0; i<allarea.length; i++) {
//			System.out.println(allarea[i].toString());
//		}
		
		// ?????? ???????????? ??????
		List<Integer> grade = new ArrayList<Integer>();
		for(int i=1; i<=2; i++) {
			grade.add(service.getMemberGrade(i));
		}
		mav.addObject("grade", grade);
		mav.addObject("guName", guName);
		mav.addObject("guNum", guNum);
		mav.setViewName("admin/adminDashboard");
		return mav;
	}
	
	@SuppressWarnings("unchecked")
	private List<String> sortByValue(final HashMap<String, Integer> sortGu) {
		// TODO Auto-generated method stub
		List<String> list = new ArrayList();
        list.addAll(sortGu.keySet());
        Collections.sort(list,new Comparator() {
            public int compare(Object o1,Object o2) {
                Object v1 = sortGu.get(o1);
                Object v2 = sortGu.get(o2);
                return ((Comparable) v2).compareTo(v1);
            }
        });
//        Collections.reverse(list); // ????????? ????????????
        return list;
	}

	@RequestMapping(value="/admin/loginOk", method = RequestMethod.POST)
	public ModelAndView adminLoginOk(String userid, String userpwd, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		Calendar now=Calendar.getInstance(); // ?????? ?????? ?????????
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm ??????"); // ?????? ??????
		String loginTime=format.format(now.getTime());
		
		if(userid.equals("seoulmate") && userpwd.equals("qwer1234!")) {
			System.out.println("????????? ????????? ??????");
			session.setAttribute("adminId", userid);
			session.setAttribute("adminStatus", "Y");
			session.setAttribute("loginTime", loginTime);
			mav.setViewName("redirect:/admin");
		}else {
			System.out.println("????????? ????????? ??????");
			mav.setViewName("redirect:/admin/login");
		}
		
		String endHouseList[]=service.endHouseList(); // ?????? ?????? ????????? ????????? ??????
		String endMateList[]=service.endMateList(); // ?????? ?????? ????????? ????????? ??????
		
		if(endHouseList.length>0) { // ?????? ????????? ???????????? 1??? ????????? ???
			for(int i=0; i<endHouseList.length; i++) {
				service.endHouse(endHouseList[i]); // ????????? -> ?????? ??????
			}
		}
		
		if(endMateList.length>0) { // ?????? ????????? ???????????? 1??? ????????? ???
			for(int i=0; i<endMateList.length; i++) {
				service.endMate(endMateList[i]); // ????????? -> ?????? ??????
			}
		}
		
		return mav;
	}
	@RequestMapping("/admin/logoutOk")
	public String adminLogoutOk(HttpSession session) {
		session.removeAttribute("adminStatus");
		session.removeAttribute("loginTime");
		
		return "/admin/adminLogin";
	}
	///////////////////////????????????//////////////////////////////
	//?????? ??????
	@RequestMapping(value="/admin/contactManagement", method= {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView contactManagement(PagingVO pVO, String state, String grade) {
		ModelAndView mav = new ModelAndView();
		pVO.setTotalRecode(service.contactRecordCnt(pVO));
		mav.addObject("contact", service.contactAllRecord(pVO));
		mav.addObject("pVO", pVO);
		mav.addObject("state", state);
		mav.addObject("grade", grade);
		mav.setViewName("admin/contactManagement");
		return mav;
	}
	//?????? ????????????
	@RequestMapping("/admin/contactDetailInfo")
	@ResponseBody
	public ContactVO contactDetailInfo(int no) {
		ContactVO cVO = service.contactInfo(no);
		System.out.println(cVO.getAdate());
		return cVO;
	}
	//?????? ????????????
	@RequestMapping("/admin/contactAdmin")
	@ResponseBody
	public int contactAdmin(ContactVO cVO) {
		int contactUpdate = 0;
		int result = service.contactUpdate(cVO);
		
		//????????? ?????? ?????????
		String email = cVO.getEmail();
		if(result>0) {
			String subject = "??????????????? - "+cVO.getUserid()+"??? ???????????? ?????? ???????????????.";
			String content = "<div style='width: 600px; border-radius: 20px; "
					+ "background-color: #fff; box-shadow: 4px 3px 10px 0px rgb(0 0 0 / 15%); overflow: hidden;'>"
					+ "<div style='height: 50px; line-height: 50px; background-color: #13a89e; color: #fff; text-align: center;'>"
					+ "<img style='width: 121; height: 30px; margin:10px 0;' src='https://0905cjw.github.io/seoulmate_logo_white.png'/></div>"
					+ "<div style='padding: 30px;'>"
					+ "<div style='margin:10px auto;'><h3>"+cVO.getQdate()+"??? ????????? ?????????????????????.</h3></div>"
					+ "<span><h3>?????? ?????? : <h3><h2>"+cVO.getqContent()+"<h2></span><br>"
					+ "<span><h3>?????? ?????? : <h3><h2>"+cVO.getaContent()+"<h2></span>"
					+ "</div><div style=\"padding: 15px 0; text-align: center; box-shadow: 0 -1px 22px -2px rgb(0 0 0 / 15%);\">"
					+ "<span style=\"color: #13a89e; font-weight:bold; font-size:12px;\">Copyright ?? 2021 ???????????? Co., Ltd. All rights reserved.</span>"
					+ "</div></div>";
			try {
				MimeMessage message=mailSender.createMimeMessage();
				MimeMessageHelper messageHelper=new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom("seoulmatemanager@gmail.com");
				messageHelper.setTo(email);
				messageHelper.setSubject(subject);
				messageHelper.setText("text/html; charset=UTF-8", content);
				mailSender.send(message);
				
				contactUpdate = result; 
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("???????????? ?????? ????????? ????????? ?????? ??????.");
			}
		}
		return contactUpdate;
	}
	///////////////////////????????????//////////////////////////////
	//?????? ??????
	@RequestMapping("/reportInsert")
	@ResponseBody
	public String reportInsert(ReportVO reportVO) {
		System.out.println("????????????????????????????"+reportVO.getCategory());
		service.reportInsert(reportVO);
		return "???????????? ??????";
	}
	//?????? ?????? ????????????
	@RequestMapping(value="/admin/reportManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView adminReport(PagingVO pVO, String state, String grade) {
		pVO.setTotalRecode(service.reportRecordCnt(pVO));
		ModelAndView mav = new ModelAndView();
		mav.addObject("report", service.reportTotalRecord(pVO));
		mav.addObject("pVO", pVO);
		mav.addObject("state", state);
		mav.addObject("grade", grade);
		
//		System.out.println("?????? ????????? : "+pVO.getTotalPage());
//		System.out.println("?????? ????????? ??? : "+pVO.getTotalRecode());
//		System.out.println("?????? ????????? : "+pVO.getStartPageNum());
//		System.out.println("?????? ????????? : "+pVO.getPageNum());
//		System.out.println("????????? ?????? : "+pVO.getOnePageNum());
//		System.out.println("????????? ????????? ????????? ??? : "+pVO.getLastPageRecode());
		
		mav.setViewName("admin/reportManagement");
		return mav;
	}
	//?????? ????????????
	@RequestMapping("/admin/reportDetailInfo")
	@ResponseBody
	public ReportVO reportDetailInfo(int num, String category) {
		ReportVO reportVO = service.reportInfo(num, category);
		reportVO.setProfilepic2(service.getProfilePic2(reportVO.getReportid()));
		return reportVO;
	}
	//TEST ?????? ??????==============================================================================
	@RequestMapping(value="/admin/json", method=RequestMethod.GET, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String json(Locale locale, Model model, String keyword) {
		String[] array = service.reportCategorySelect(keyword);
		
		Gson gson = new Gson();
		
		return gson.toJson(array);
	}
	//?????? ????????????
	@RequestMapping("/admin/reportAdmin")
	@ResponseBody
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public String reportAdmin(ReportVO reportVO, boolean visibility, boolean blacklist) {
		String result = "";
		
		//????????????
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // ???????????? ??????
		TransactionStatus status = transactionManager.getTransaction(def); 
		
		//????????? ?????? ????????? true??? ????????? state??? ????????????.
		if(visibility && reportVO.getState().equals("????????????")) {
			System.out.println(reportVO.getNo()+"------????????????");
			System.out.println(reportVO.getUserid()+"------???????????? ?????????");
			try {
				if(!reportVO.getCategory().equals("??????")) {
					service.allStateUdate(reportVO.getNo(), reportVO.getUserid(), reportVO.getCategory(), reportVO.getState()); //??? ?????? ???????????? ??????
				}
				service.reportStateUpdate(reportVO.getNum(), reportVO.getState()); //???????????????????????? ??????????????? ????????????

				int reportNum = service.checkReportCnt(reportVO.getUserid()); // ?????? ????????? ??????
				//5??? ???????????? ??????????????? ??????
				if(reportNum>=5) {
					service.addBlacklist(reportVO.getUserid());
					result += "blacklist+";
				}
				transactionManager.commit(status);
				result += "blocked";
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("???????????? ???????????? 1 - ???????????? ??????");
				result = "failed";
			}
		
		// ???????????? ??????
		}else if(reportVO.getState().equals("????????????")) {
		
			try {
				if(!reportVO.getCategory().equals("??????")) {
					service.allStateUdate(reportVO.getNo(), reportVO.getUserid(), reportVO.getCategory(), reportVO.getState()); //??? ?????? ???????????? ??????
				}
				service.reportStateUpdate(reportVO.getNum(), reportVO.getState());
				
				int reportNum = service.checkReportCnt(reportVO.getUserid()); // ?????? ????????? ??????
				//??????????????? ???????????? ?????? ???????????? 5?????? ?????????
				if(reportNum<5) {
					service.removeBlacklist(reportVO.getUserid());
					result += "blacklist removed+";
				}
				
				transactionManager.commit(status);
				result = "false report";
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("???????????? ???????????? 2 - ???????????? ?????? ??????");
				result = "false report failed";
			}
		}
		//??????????????? ????????? true??? ?????? ?????? ??????????????? ??????
		if(blacklist && reportVO.getState().equals("????????????")) {
			System.out.println(reportVO.getUserid()+"---------->blacklist userid");
			service.addBlacklist(reportVO.getUserid());
			result = "added to blacklist";
		}
		
		return result;
	}
	///////////////////////////////////////////////////////
	//?????????-??????
	@RequestMapping(value="/admin/memberManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView memberManagement(String state, String grade, PagingVO pVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		pVO.setTotalRecode(service.membertotalRecord(pVO));
		
		mav.addObject("state", state);
		mav.addObject("grade", grade);
		mav.addObject("list", service.memberSelect(pVO));
		mav.addObject("pVO", pVO);
		
//		System.out.println("?????? ????????? : "+pVO.getTotalPage());
//		System.out.println("?????? ????????? ??? : "+pVO.getTotalRecode());
//		System.out.println("?????? ????????? : "+pVO.getStartPageNum());
//		System.out.println("?????? ????????? : "+pVO.getPageNum());
//		System.out.println("????????? ?????? : "+pVO.getOnePageNum());
//		System.out.println("????????? ????????? ????????? ??? : "+pVO.getLastPageRecode());
		mav.setViewName("admin/memberManagement");
		
		return mav;
	}
	
	@RequestMapping("/admin/memberInfo")
	@ResponseBody
	public MemberVO memberInfo(String userid) {
		MemberVO vo=service.memberInfo(userid);
		
		return vo;
	}
	
	@RequestMapping(value="/admin/memInfoSave", method=RequestMethod.POST, produces="application/text;charset=UTF-8")
	@ResponseBody
	public String memInfoSave(MemberVO vo, HttpSession session, HttpServletRequest req) {
		String path=session.getServletContext().getRealPath("/profilePic");
		String selFilename=service.memberProfile(vo.getUserid());
		
		String delFilename=req.getParameter("delFile"); // ???????????? ????????? ??? ?????? ???????????? delFile??? ????????????.
		
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)req;
		
		MultipartFile newName=mr.getFile("filename");
		String newUpload="";
		String res="1";
		
		
		if(newUpload!=null && newName!=null) {
			String orgname=newName.getOriginalFilename(); // ????????? ?????????
			
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
					System.out.println("????????? ?????? ?????? ?????? ?????? ??????");
					e.printStackTrace();
				}
				newUpload=ff.getName();
				vo.setProfilePic(newUpload);
			}else {
				vo.setProfilePic(selFilename);
			}
			int result=service.memberInfoSave(vo);
			
			if(result>0) { // ???????????? ????????? ????????? ??????
				if(orgname!="" && orgname!=null) {
					try {
						File dFileObj=new File(path, delFilename);
						dFileObj.delete();
					}catch(Exception e) {
						System.out.println("??? ?????? ??? ????????? ?????? ?????? ?????? ??????");
						e.printStackTrace();
					}
				}else {
					try {
						File dFileObj=new File(path, newUpload);
						dFileObj.delete();
					}catch(Exception e) {
						System.out.println("??? ?????? ??? ????????? ?????? ?????? ?????? ??????");
						e.printStackTrace();
					}
				}
				res="2";
			}else { // ???????????? ????????? ????????? ??????
				if(orgname=="") {
					try {
						File dFileObj=new File(path, newUpload);
						dFileObj.delete();
					}catch(Exception e) {
						System.out.println("??? ?????? ??? ????????? ?????? ?????? ?????? ??????");
						e.printStackTrace();
					}
				}else {
					try {
						File dFileObj=new File(path, delFilename);
						dFileObj.delete();
					}catch(Exception e) {
						System.out.println("??? ?????? ??? ????????? ?????? ?????? ?????? ??????");
						e.printStackTrace();
					}
				}
			}
		}
		
		return res;
	}
	///////////////////////////////////////////////////////
	
	//????????? - ??????????????? 
	@RequestMapping(value="/admin/houseManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView houseManagement(HouseWriteVO hwVO, PagingVO pagingVO) {
		ModelAndView mav = new ModelAndView();
		
		hwVO.setHousestate(pagingVO.getState());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("hwVO", hwVO);
		map.put("pagingVO", pagingVO);
		// ????????? ?????? ??? ????????? ??? ?????????. 
		pagingVO.setTotalRecode(service.houseTotalRecode(map));
		//2. ??????????????? ???????????? ????????? ??? ????????? 
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("hwVO", hwVO);
		map1.put("pagingVO", pagingVO);
		
		mav.addObject("houseWriteList", service.houseOnePageListSelect(map1));
		if(pagingVO.getPageNum()>pagingVO.getTotalPage()) {
			pagingVO.setPageNum(pagingVO.getTotalPage());
		}
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
		// houseWriteVO ??? ?????? 
		hwVO = service.houseDetailInfoSelect(hwVO);
		// housePropensityVO ??? ??????
		int pno = hwVO.getPno();
		PropensityVO propenVO = service.propensitySelect(pno);
		// houseRoomVO ??? ??????
		List<HouseRoomVO> hrVOList = service.houseRoomInfoSelect(hwVO);
		resultMap.put("hwVO", hwVO);
		resultMap.put("propenVO", propenVO);
		resultMap.put("hrVOList", hrVOList);
		return resultMap;
	}
	
	//????????? - ??????
	@RequestMapping(value="/admin/house_ManagementEdit", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public int houseManagementEdit(HouseWriteVO hwVO, HttpSession session, HttpServletRequest req) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		String path = session.getServletContext().getRealPath("/housePic");
		
		List<String> delFile = new ArrayList<String>();
		if(hwVO.getHousepic1()!=null && !hwVO.getHousepic1().equals("")) { 
			delFile.add(hwVO.getHousepic1()); }
		if(hwVO.getHousepic2()!=null && !hwVO.getHousepic2().equals("")) { 
			delFile.add(hwVO.getHousepic2()); }
		if(hwVO.getHousepic3()!=null && !hwVO.getHousepic3().equals("")) { 
			delFile.add(hwVO.getHousepic3()); }
		if(hwVO.getHousepic4()!=null && !hwVO.getHousepic4().equals("")) { 
			delFile.add(hwVO.getHousepic4()); }
		if(hwVO.getHousepic5()!=null && !hwVO.getHousepic5().equals("")) { 
			delFile.add(hwVO.getHousepic5()); }
		System.out.println(delFile);
		
		HouseWriteVO dbHvo = service.housepicSelect(hwVO.getPno());
		List<String> dbFile = new ArrayList<String>();
		
		if(dbHvo.getHousepic1()!=null && !dbHvo.getHousepic1().equals("")) { 
			dbFile.add(dbHvo.getHousepic1()); }
		if(dbHvo.getHousepic2()!=null && !dbHvo.getHousepic2().equals("")) { 
			dbFile.add(dbHvo.getHousepic2()); }
		if(dbHvo.getHousepic3()!=null && !dbHvo.getHousepic3().equals("")) { 
			dbFile.add(dbHvo.getHousepic3()); }
		if(dbHvo.getHousepic4()!=null && !dbHvo.getHousepic4().equals("")) { 
			dbFile.add(dbHvo.getHousepic4()); }
		if(dbHvo.getHousepic5()!=null && !dbHvo.getHousepic5().equals("")) { 
			dbFile.add(dbHvo.getHousepic5()); }
		System.out.println(dbFile);
		
		
		Map<String, String> map = new HashMap<String, String>();
		for(int del=0; del<delFile.size(); del++) {
			dbFile.remove(delFile.get(del));
		}
		System.out.println("dbFile2222 "+dbFile);
		for(int d=0; d<dbFile.size(); d++) {
			String key = "housepic"+(d+1);
			map.put(key, dbFile.get(d));
		}
		System.out.println(map);
		//???????????? ??????
		System.out.println(hwVO.getHousestate());
		int re = service.houseStateUpdate(hwVO);
		if(re>0) {
			if(map.size()==0) {
				return 200;
			}else {
System.out.println("state ???????????? ??????");
				// db?????? update ??????  
				for(int a=(map.size()); a<5; a++ ) {
					String key = "housepic"+(a+1);
					map.put(key, "10000");
				}
				map.put("pno", Integer.toString(hwVO.getPno()));
				System.out.println(map);
				
				int result = service.housePicUpdate(map);
				if(result>0) {
System.out.println("DB?????? ???????????? ??????");
					// update ??????
					// ?????? ??????
					try {
						for(int i=0; i<delFile.size(); i++) {
							File f = new File(path, delFile.get(i)) ;
							f.delete();
						}
						System.out.println("??????????????????");
					} catch (Exception e) {
						System.out.println("??????????????????");
						return  200;
					}
					transactionManager.commit(status);
System.out.println("???????????? ?????? ??????, ??????");
					return 1;
				}else {
					// update ??????
					transactionManager.rollback(status);
					return 200;
				}
			}
		}else {
			transactionManager.rollback(status);
			return 200;
		}
	}
	// ????????? ??????
	@RequestMapping(value="/admin/mate_ManagementEdit", method={RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public int mateManagementEdit(MateWriteVO mwVO, HttpSession session, HttpServletRequest req) {
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		String path = session.getServletContext().getRealPath("/matePic");
		
		List<String> delFile = new ArrayList<String>();
		if(mwVO.getMatePic1()!=null && !mwVO.getMatePic1().equals("")) { 
			delFile.add(mwVO.getMatePic1()); }
		if(mwVO.getMatePic2()!=null && !mwVO.getMatePic2().equals("")) { 
			delFile.add(mwVO.getMatePic2()); }
		if(mwVO.getMatePic3()!=null && !mwVO.getMatePic3().equals("")) { 
			delFile.add(mwVO.getMatePic3()); }
		System.out.println("delFile"+delFile);
		
		MateWriteVO dbHvo = service.matepicSelect(mwVO.getPno());
		List<String> dbFile = new ArrayList<String>();
		
		if(dbHvo.getMatePic1()!=null && !dbHvo.getMatePic1().equals("")) { 
			dbFile.add(dbHvo.getMatePic1()); }
		if(dbHvo.getMatePic2()!=null && !dbHvo.getMatePic2().equals("")) { 
			dbFile.add(dbHvo.getMatePic2()); }
		if(dbHvo.getMatePic3()!=null && !dbHvo.getMatePic3().equals("")) { 
			dbFile.add(dbHvo.getMatePic3()); }
		System.out.println("dbFile"+dbFile);
		
		Map<String, String> map = new HashMap<String, String>();
		
		for(int del=0; del<delFile.size(); del++) {
			dbFile.remove(delFile.get(del));
		}
		System.out.println("dbFile2222 "+dbFile);
		for(int d=0; d<dbFile.size(); d++) {
			String key = "matePic"+(d+1);
			map.put(key, dbFile.get(d));
		}
		System.out.println("map"+map);
		//???????????? ??????
		System.out.println(mwVO.getMatestate());
		int re = service.mateStateUpdate(mwVO);
		if(re>0) {
			if(map.size()==0) {
				return 200;
			}else {
System.out.println("state ???????????? ??????");
				// db?????? update ??????  
				for(int a=(map.size()); a<3; a++ ) {
					String key = "matePic"+(a+1);
					map.put(key, "10000");
				}
				map.put("pno", Integer.toString(mwVO.getPno()));
				System.out.println("map2"+map);
				
				
				int result = service.matePicUpdate(map);
				if(result>0) {
System.out.println("DB?????? ???????????? ??????");
					// update ??????
					// ?????? ??????
					try {
						for(int i=0; i<delFile.size(); i++) {
							File f = new File(path, delFile.get(i)) ;
							f.delete();
						}
						System.out.println("??????????????????");
					} catch (Exception e) {
						System.out.println("??????????????????");
						return  200;
					}
					transactionManager.commit(status);
System.out.println("???????????? ?????? ??????, ??????");
					return 1;
				}else {
					// update ??????
					transactionManager.rollback(status);
					return 200;
				}
			}
		}else {
			transactionManager.rollback(status);
			return 200;
		}
	}
	
	//????????? - ?????????????????? 
	@RequestMapping(value="/admin/mateManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView mateManagement(MateWriteVO mwVO, PagingVO pagingVO) {
		ModelAndView mav = new ModelAndView();
		mwVO.setMatestate(pagingVO.getState());
		// ????????? ?????? ??? ????????? ???. 
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mwVO", mwVO);
		map.put("pagingVO", pagingVO);
		pagingVO.setTotalRecode(service.mateTotalRecode(map));
		
		
		//2. ??????????????? ???????????? ?????????
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("mwVO", mwVO);
		map1.put("pagingVO", pagingVO);
		
		mav.addObject("mateWriteList", service.mateOnePageListSelect(map1));
		if(pagingVO.getPageNum()>pagingVO.getTotalPage()) {
			pagingVO.setPageNum(pagingVO.getTotalPage());
		}
		mav.addObject("mwVO", mwVO);
		mav.addObject("pagingVO", pagingVO);
		mav.setViewName("admin/mateManagement");
		return mav;
	}
	
	@RequestMapping(value="/admin/mateDetailInfo", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public Map<String, Object> mateDetailInfo(HttpServletRequest req){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		int no = Integer.parseInt((String)req.getParameter("no"));
		String userid = req.getParameter("userid");
		
		MateWriteVO mwVO = new MateWriteVO();
		mwVO.setNo(no);
		mwVO.setUserid(userid);
		// mate ?????? ????????????
		mwVO = service.mateDetailInfoSelectMateWrite(mwVO);
		int pno = mwVO.getPno();
		// mate PropensityVO ??? ??????
		PropensityVO propenVO = service.propensitySelect(pno);
		// mate ??? member ??????
		MemberVO memVO = service.mateDetailInfoSelectMember(userid);
		resultMap.put("mwVO", mwVO);
		resultMap.put("propenVO", propenVO); 
		resultMap.put("memVO", memVO);
		
		return resultMap;
	}
	
	//????????? - ?????? 
	@RequestMapping(value="/admin/payManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView payManagement(PayVO payVO, PagingVO pagingVO, String nodeResult) {
		System.out.println("?? ");
		ModelAndView mav = new ModelAndView();
		// 1.??? ????????? 
		Map<String, Object> map = new HashMap<String, Object>();
		String selectStartDate = "";
		String selectEndDate = "";
		if( payVO.getSelectYearMonthDate()!=null) {
			if((payVO.getSelectYearMonthDate()).equals("??????")) {
				selectStartDate = (String)(payVO.getSelectStartDate()).substring(0, 4);
				selectEndDate = (String)(payVO.getSelectEndDate()).substring(0, 4);
				payVO.setSelectStartDate(selectStartDate);
				payVO.setSelectEndDate(selectEndDate);
			}
		}
		map.put("payVO", payVO);
		map.put("pagingVO", pagingVO);
		pagingVO.setTotalRecode(service.payTotalRecode(map));
		// 2. ???????????? ????????? ????????? 
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("payVO", payVO);
		map1.put("pagingVO", pagingVO);
		
		mav.addObject("payList", service.payOnePageListSelect(map1));
		if(pagingVO.getPageNum()>pagingVO.getTotalPage()) {
			pagingVO.setPageNum(pagingVO.getTotalPage());
		}
		
		mav.addObject("payVO", payVO);
		mav.addObject("pagingVO", pagingVO);
		mav.addObject("nodeResult", nodeResult);
		mav.setViewName("admin/payManagement");
		return mav;
	}		
	//????????? - ??????
	@RequestMapping(value="/admin/salesManagement", method={RequestMethod.POST, RequestMethod.GET})
	public ModelAndView salesManagement(PayVO payVO, PagingVO pagingVO) {
		ModelAndView mav = new ModelAndView();
		//???????????? payStart??? ??????.
		System.out.println(payVO.getSelectYearMonthDate());
		if(payVO.getOrderCondition().equals("no")) {
			payVO.setOrderCondition("payStart"); 
		}
		String selectStartDate = "";
		String selectEndDate = "";
		if(payVO.getSelectYearMonthDate()!=null){
			if(payVO.getSelectYearMonthDate().equals("??????")) {
				System.out.println("payVO.getSelectStartDate()"+payVO.getSelectStartDate());
				if(payVO.getSelectStartDate()!=null) {
					try {
					selectStartDate = (String)(payVO.getSelectStartDate()).substring(0, 4);
					payVO.setSelectStartDate(selectStartDate);
					} catch (StringIndexOutOfBoundsException e) {
						selectStartDate = "";
					}
				}
				System.out.println("payVO.getSelectEndDate()"+payVO.getSelectEndDate());
				if(payVO.getSelectEndDate()!=null) {
					try {
					selectEndDate = (String)(payVO.getSelectEndDate()).substring(0, 4);
					payVO.setSelectEndDate(selectEndDate);
					} catch (StringIndexOutOfBoundsException e) {
						selectEndDate = "";
					}
				}
			}
		}
		if(payVO.getSelectYearMonthDate()==null) {
			payVO.setSelectYearMonthDate("??????");
		}
		// year Recode
		List<PayVO> yearList = new ArrayList<PayVO>();
		payVO.setMsg("year");
		yearList = service.salesList(payVO);
		// month Recode
		List<PayVO> monthList = new ArrayList<PayVO>();
		payVO.setMsg("month");
		monthList = service.salesList(payVO);
		// date Recode
		List<PayVO> dateList = new ArrayList<PayVO>();
		payVO.setMsg("date");
		dateList = service.salesList(payVO);
		// ????????? ?????? ???????????? ??? ??????
		List<PayVO> totalList = new ArrayList<PayVO>();
		payVO.setMsg("total");
		totalList = service.salesList(payVO);
		PayVO totalVO = totalList.get(0);
		mav.addObject("yearList", yearList);
		mav.addObject("monthList", monthList);
		mav.addObject("dateList", dateList);
		mav.addObject("totalVO", totalVO);
		mav.addObject("payVO", payVO);
		mav.setViewName("admin/salesManagement");
		return mav;
	}	
	@RequestMapping("/admin/salesUserList")
	@ResponseBody
	public List<PayVO> salesUserList(HttpServletRequest req){
		String date = req.getParameter("date");
		List<PayVO> userList = new ArrayList<PayVO>();
		userList = service.salesUserList(date);
		return userList;
	}
	
	//?????????.. 
	@RequestMapping("/admin/adminPrintPage")
	public ModelAndView adminPrintPage(HttpServletRequest req, PagingVO pagingVO) {
		String msg = (String)req.getParameter("msg");
		
		ModelAndView mav =  new ModelAndView();
		if(msg.equals("mateWrite") || msg.equals("mateExcel") ) {
			List<MateWriteVO> mwList = new ArrayList<MateWriteVO>();
			
			MateWriteVO mwVO = new MateWriteVO();
			mwVO.setMatestate((String)req.getParameter("matestate"));
			mwVO.setGrade(Integer.parseInt((String)req.getParameter("grade")));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mwVO", mwVO);
			map.put("pagingVO", pagingVO);
			
			mwList = service.mateListSelect(map);
			mav.addObject("mwList", mwList);
			if(msg.equals("mateWrite")) {
				mav.addObject("msg", "mate");
			}else if(msg.equals("mateExcel")) {
				mav.addObject("msg", "mateExcel");
			}
		}else if(msg.equals("houseWrite") || msg.equals("houseExcel") ) {
			List<HouseWriteVO> hwList = new ArrayList<HouseWriteVO>();
			
			HouseWriteVO hwVO = new HouseWriteVO();
			hwVO.setHousestate((String)req.getParameter("housestate"));
			hwVO.setGrade(Integer.parseInt((String)req.getParameter("grade")));
			Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("hwVO", hwVO);
			map.put("pagingVO", pagingVO);
			
			hwList = service.houseListSelect(map);
			
			mav.addObject("hwList", hwList);
			if(msg.equals("houseWrite")) {
				mav.addObject("msg", "house");
			}else if(msg.equals("houseExcel")) {
				mav.addObject("msg", "houseExcel");
			}
		}else if(msg.equals("pay") || msg.equals("sales") || msg.equals("payExcel") || msg.equals("salesExcel")) {
			PayVO payVO = new PayVO();
			payVO.setSelectYearMonthDate((String)req.getParameter("selectYearMonthDate"));
			payVO.setSelectStartDate((String)req.getParameter("selectStartDate"));
			payVO.setSelectEndDate((String)req.getParameter("selectEndDate"));
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("payVO", payVO);
			map.put("pagingVO", pagingVO);
			
			if(msg.equals("pay") || msg.equals("payExcel")) {
				List<PayVO> payList = new ArrayList<PayVO>();
				payList = service.payListSelect(map);
				mav.addObject("payList", payList);
				if(msg.equals("pay")) {
					mav.addObject("msg", "pay");
				}else if( msg.equals("payExcel")) {
					mav.addObject("msg", "payExcel");
				}	
			}else if(msg.equals("sales") || msg.equals("salesExcel")) {
				List<PayVO> salesList = new ArrayList<PayVO>();
				if(payVO.getSelectYearMonthDate().equals("??????")) {
					payVO.setMsg("year");
				}else if(payVO.getSelectYearMonthDate().equals("??????")) {
					payVO.setMsg("month");
				}else if(payVO.getSelectYearMonthDate().equals("??????")) {
					payVO.setMsg("date");
				}else {
					payVO.setMsg("date");
				}
				salesList = service.salesList(payVO);
				payVO.setMsg("total");
				List<PayVO> total_list = new ArrayList<PayVO>();
				total_list = service.salesList(payVO);
				mav.addObject("total_list", total_list);
				mav.addObject("salesList", salesList);
				if(msg.equals("sales")) {
					mav.addObject("msg", "sales");	
				}else if(msg.equals("salesExcel")){
					mav.addObject("msg", "salesExcel");	
				}
			}	
		}
		mav.setViewName("admin/adminPrintPage");
		return mav;
	}
	//????????? ????????? ????????? ???????????? 
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
	// ???????????? ?????? ??????
	@RequestMapping("/admin/faqManagement")
	public ModelAndView faqManagement(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		
		mav.addObject("faqList", service.faqAllRecord());
		mav.setViewName("admin/faqManagement");
		
		return mav;
	}
	
	@RequestMapping("/admin/faqList")
	@ResponseBody
	public List<FaqVO> faqList(){
		return service.faqAllRecord();
	}
	
	@RequestMapping("/admin/faqInfo")
	@ResponseBody
	public FaqVO faqInfo(int no) {
		FaqVO vo=service.faqInfo(no);
		
		return vo;
	}
	
	@RequestMapping("/admin/faqInsert")
	@ResponseBody
	public int faqInsert(FaqVO vo) {
		System.out.println(vo.getNo());
		System.out.println(vo.getSubject());
		System.out.println(vo.getContent());
		System.out.println(vo.getUserid());
		int result=0;
		int res=service.faqInsert(vo);
		if(res==1) {
			result=res;
		}
		return result;
	}
	
	@RequestMapping("/admin/faqEdit")
	@ResponseBody
	public int faqEdit(FaqVO vo) {
		int result=0;
		int res=service.faqUpdate(vo);
		if(res==1) {
			result=res;
		}
		return result;
	}
	
	@RequestMapping("/admin/faqDel")
	@ResponseBody
	public int faqDel(FaqVO vo) {
		int result=0;
		int res=service.faqDel(vo);
		if(res==1) {
			result=res;
		}
		return result;
	}
	
	@RequestMapping(value="/admin/cancelPay" , method=RequestMethod.POST)
	@ResponseBody
	public String cancelPay(Model model, String merchant_uid, String cancel_request_amount, String selectYearMonthDate,
				String selectStartDate, String selectEndDate, String orderCondition, String orderUpDown,
				String searchKey, String searchWord, int pageNum) {
		JsonObject cancelData = new  JsonObject();
		cancelData.addProperty("merchant_uid", merchant_uid);
		cancelData.addProperty("cancel_request_amount", cancel_request_amount);
		cancelData.addProperty("selectYearMonthDate",selectYearMonthDate);
		cancelData.addProperty("selectStartDate",selectStartDate);
		cancelData.addProperty("selectEndDate",selectEndDate);
		cancelData.addProperty("orderCondition",orderCondition);
		cancelData.addProperty("orderUpDown",orderUpDown);
		cancelData.addProperty("searchKey",searchKey);
		cancelData.addProperty("searchWord",searchWord);
		cancelData.addProperty("pageNum",Integer.toString(pageNum));
		URLConn conn = new URLConn("http://192.168.0.33", 9092);
		conn.urlPost(cancelData);
		
		
		return "end";
	}
}
