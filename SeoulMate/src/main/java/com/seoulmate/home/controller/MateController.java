package com.seoulmate.home.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.HomeService;
import com.seoulmate.home.service.ListService;
import com.seoulmate.home.service.MateService;
import com.seoulmate.home.service.MemberService;
import com.seoulmate.home.vo.ListVO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PropensityVO;

@Controller
public class MateController {
	@Inject
	MateService service;
	@Inject
	MemberService memService;
	@Inject
	ListService listService;
	@Inject
	HomeService HomeService;
	
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/mateIndex")
	public ModelAndView mateIndex(HttpSession session, String area) {
		ModelAndView mav=new ModelAndView();
		String userid=(String)session.getAttribute("logId");
		
		Calendar cal = Calendar.getInstance();
        int y  = cal.get(Calendar.YEAR);
        int m = cal.get(Calendar.MONTH) + 1;
        int d   = cal.get(Calendar.DAY_OF_MONTH);
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
        int today = Integer.parseInt(format.format(cal.getTime()));
        
        // 내 하우스 성향 가져오기
		if(session.getAttribute("logId")!=null) {
			int myHousePnoCnt=listService.myHousePnoCount(userid);
			mav.addObject("myHousePnoCnt", myHousePnoCnt);
			if(myHousePnoCnt>0) { // 하우스 성향이 있는 경우
				List<PropensityVO> myHousePnoList=listService.myHousePno(userid);
				mav.addObject("myHousePno", myHousePnoList);
			}
		}
		
		// 매칭
		if(session.getAttribute("logId")!=null) {
			int logGrade=(Integer)session.getAttribute("logGrade");
			// 프리미엄일 때만
			if(logGrade==2) {
				// 메이트의 희망 성별 가져오기
				int housePnoCheck=listService.myHousePnoCount(userid);
				
				mav.addObject("housePnoCheck", housePnoCheck); // 하우스 번호의 갯수를 반환한다.(하우스 성향이 없는 사람이 있기 때문에)
				
				if(session.getAttribute("hPno")!=null) {
					int pno=(Integer)session.getAttribute("hPno"); // 로그인 후에 세션에 저장된 하우스 성향 번호를 가져온다.
					
					if(housePnoCheck>0) { // 메이트 성향이 있을 때만 매칭된 하우스 목록을 띄워준다.
						int m_gender=listService.house_m_gender(userid, pno);
						// 메이트 매칭 리스트 구하기
						List<ListVO> pmList = listService.premiumMateList(userid, pno, m_gender, area);
						
						if(pmList.size()>0) {
							if(pmList.get(0)!=null) {
								for(ListVO pmVO : pmList) {
									MemberVO mVO=HomeService.getDetail(pmVO.getUserid());
									pmVO.setGender(mVO.getGender());
									
									// 생년월일을 받아서 만 나이로 처리
									String b=mVO.getBirth();
									int i=b.indexOf(" 00");
									b=b.substring(0, i+1);
									String birth[]= b.split("-");
									int bYear=Integer.parseInt(birth[0]);
									int bMonth=Integer.parseInt(birth[1]);
									int bDay=Integer.parseInt(birth[2].replace(" ", ""));
									int age=(y-bYear);
									
									// 생일이 안 지난 경우 -1
									if(bMonth * 100 + bDay > m * 100 + d) {
										age--;
									}
									String BrithAge=age+"";
									pmVO.setBirth(BrithAge);
									
									// 입주 디데이 9일 때 즉시 문자열 처리
									String e=pmVO.getEnterdate();
									int ee=e.indexOf(" ");
									e=e.substring(0, ee+1);
									e=e.replace(" ", "");
									int enterNum=Integer.parseInt(e.replace("-", ""));
									String enterDay="";
									if(enterNum - today > 0 && enterNum - today <= 7) {
										enterDay="즉시";
									}else {
										enterDay=(enterNum-today) + "일";
									}
									pmVO.setEnterdate(enterDay);
								}
								mav.addObject("pmList", pmList);
							}
						}
					}
				}
			}
		}
		
		// 하우스메이트 최신리스트 구하기
		List<MateWriteVO> nmList = service.getNewIndexMate(area); // 1. homeService 함수는 row<=3이고, MateService는 row<=9
	    
		for (MateWriteVO mwVO : nmList) {
			// 각 하우스 메이트의 성별, 나이 구하기
			MemberVO mVO = HomeService.getDetail(mwVO.getUserid());
			mwVO.setGender(mVO.getGender());
			
			if(session.getAttribute("hPno")!=null) {
				if(session.getAttribute("logId")!=null) {
					if((Integer)session.getAttribute("logGrade")==2) {
						ListVO scoreVO=listService.premiumMateScore(userid, (Integer)session.getAttribute("hPno"), mwVO.getPno());
						mwVO.setScore(scoreVO.getScore());
					}
				}
			}	 
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
			
			ListVO listVO=new ListVO();
			listVO.setArea(mwVO.getArea());
			mwVO.setListVO(listVO);
		}
		
		mav.addObject("newMateListCnt", nmList.size()); // 필터에 맞는 최신 목록의 메이트가 없을 때
		mav.addObject("newMateList", nmList);
		mav.addObject("area", area); // 검색을 하고 페이지를 다시 띄워줄 때 입력한 값이 뭔지 알려주려고
		
		mav.setViewName("mate/mateIndex");
	return mav;
	}

	@RequestMapping("/mateView")
	public String houseSearch() {
		return "mate/mateView";
	}
	
	//메이트 글 등록
	@RequestMapping("/mateWrite")
	public ModelAndView mateWrite(String userid, HttpSession session) {
		userid = (String)session.getAttribute("logId");
		ModelAndView mav = new ModelAndView();
//		PropensityVO pVO = service.mateSelect(userid); //메이트 성향
		PropensityVO pVO=memService.propMateSelect(userid);
		if(pVO==null) { //메이트 성향이 없을 경우?
		mav.setViewName("redirect:memberProEdit"); //성향수정 페이지로 이동
		}else { //메이트 성향이 있을 경우 id 기준으로 값 가져감
		MemberVO mVO = memService.memberSelect(userid);
		
		mav.setViewName("mate/mateWrite");
		mav.addObject("pVO",pVO);
		mav.addObject("mVO", mVO);
		}
		System.out.println(pVO.getH_supportStr());
		return mav;
	}
	
	//메이트 글 등록 확인
	@RequestMapping(value = "/mateWriteOk", method = RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView mateWriteOk(MateWriteVO mVO, PropensityVO pVO, @RequestParam("filename") MultipartFile filename, HttpSession session, HttpServletRequest req) {
		mVO.setUserid((String)session.getAttribute("logId"));
		pVO.setUserid((String)session.getAttribute("logId"));
		pVO.setPcase("m");
		//사진 업로드
		
			String path = req.getSession().getServletContext().getRealPath("/housePic"); //파일 저장위치 절대경로 구하기

			String orgName=filename.getOriginalFilename(); // 기존 파일 명
			String realName="";
			
			try {
				if(orgName != null && !orgName.equals("")) {
					File f=new File(path, orgName);
					int i=1;
					while(f.exists()) {
						int point=orgName.lastIndexOf(".");
						String name=orgName.substring(0, point);
						String extName=orgName.substring(point+1);
						
						f=new File(path, name+"_"+ i++ +"."+extName);
					}
					filename.transferTo(f); // 업로드
					realName=f.getName();
					mVO.setMatePic1(f.getName());
				}
			}catch(Exception e) {
				System.out.println("메이트 사진 업로드 에러 발생");
				e.printStackTrace();
			}
			
			ModelAndView mav = new ModelAndView();
			
			DefaultTransactionDefinition def=new DefaultTransactionDefinition();
			def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // 트랜잭션 호출
			TransactionStatus status=transactionManager.getTransaction(def);


			try {
				int result1 = service.mateInsert(mVO);
				if(result1>0) {//메이트 등록 
					System.out.println("메이트 등록 성공");
					
					int result2 = service.propMateUpdate(pVO);
					if(result2>0) { //성향 수정 
						System.out.println("메이트 성향 수정 성공");
						
						transactionManager.commit(status);
						mav.setViewName("redirect:mateIndex");
					}else {System.out.println("메이트 성향 수정 실패");}
				}else {
					System.out.println("메이트 등록 실패");
				}
			}catch(Exception e) {
				System.out.println("메이트 글 등록 실패");
				try { //파일업로드 트랜잭션
					File dFileObj = new File(path, realName);
					dFileObj.delete();
				}catch(Exception ee) {
					System.out.println("파일 업로드 실패 (트랜잭션) 실행");
					ee.printStackTrace();
				}
				mav.setViewName("redirect:mateWrite");
			}
		return mav;	
	};
	
	//메이트 수정
	@RequestMapping("/mateEdit")
	public ModelAndView mateEdit(MateWriteVO mVO, PropensityVO pVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)session.getAttribute("logId");
		mVO = service.mateSelect(userid);
		System.out.println("mVO->"+mVO.getUserid());
		
		pVO = memService.propMateSelect(userid);
		System.out.println("pVO->"+pVO.getUserid());
		System.out.println("메이트 글 번호 확인:"+mVO.getNo());
		mav.addObject("mVO", mVO);
		mav.addObject("pVO", pVO);
		mav.setViewName("mate/mateEdit");
		return mav;
	}
	
	//메이트 수정 확인
	@RequestMapping(value = "/mateEditOk", method = RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView mateEditOk(MateWriteVO mVO, PropensityVO pVO, HttpServletRequest req, @RequestParam("filename") MultipartFile filename) {
		ModelAndView mav = new ModelAndView();
		mVO.setUserid((String)req.getSession().getAttribute("logId"));
		pVO.setUserid((String)req.getSession().getAttribute("logId"));
		pVO.setPcase("m");
		
		//사진 수정
		
		
		DefaultTransactionDefinition def=new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // 트랜잭션 호출
		TransactionStatus status=transactionManager.getTransaction(def);
		
		try {
			int result1 = service.mateUpdate(mVO);
			if(result1>0) {
				System.out.println("메이트 글 수정 완료");
				
				int result2 = memService.propMateUpdate(pVO);
				if(result2>0) {
					System.out.println("메이트성향 수정 성공");
					transactionManager.commit(status);
					mav.setViewName("redirect:mateIndex");
				}else {
					System.out.println("메이트성향 수정 실패");
					mav.setViewName("redirect:mateEdit");
				}
			}else {
				System.out.println("메이트 글 수정 실패");
			}
		}catch(Exception e) {
			System.out.println("메이트 글+성향 수정 실패");
			//사진 수정 트랜잭션 실행문
		}
		
		return mav;
	}
	
	
	//메이트 삭제
	@RequestMapping("/mateDel")
	public ModelAndView mateDel(MateWriteVO mVO, PropensityVO pVO) {
		ModelAndView mav = new ModelAndView();
		
		
		return mav;
	}
	
	@RequestMapping(value = "/hpnoDefaultMateIndex", method = RequestMethod.GET)
	public ModelAndView hpnoDefaultMateIndex(HttpSession session, int pno) {
		ModelAndView mav=new ModelAndView();
		String userid=(String)session.getAttribute("logId");
		
		// 내 하우스 성향의 갯수를 구한다.(프리미엄인 하우스에게 메이트 매칭 목록을 띄워주기 위해)
		int myHousePnoCnt=listService.myHousePnoCount(userid);
		if(myHousePnoCnt>0) {
			session.setAttribute("hPno", pno);
		}
		mav.setViewName("redirect:mateIndex");
		
		return mav;
	}
	
	
}
