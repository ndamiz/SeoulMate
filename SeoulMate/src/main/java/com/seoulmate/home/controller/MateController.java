package com.seoulmate.home.controller;

import java.io.File;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.HouseService;
import com.seoulmate.home.service.MateService;
import com.seoulmate.home.service.MemberService;
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
	HouseService hService;
	
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/mateIndex")
	public String mateIndex() {
	return "mate/mateIndex";
	}

	@RequestMapping("/mateView")
	public ModelAndView houseSearch(int no) {
		ModelAndView mav = new ModelAndView();
		
		MateWriteVO mVO = service.mateSelect2(no);
		PropensityVO pVO = service.propMateSelect2(mVO.getPno());
		String memProfilePic = hService.memberProfile(mVO.getUserid());
		
		mav.addObject("mVO", mVO);
		mav.addObject("pVO", pVO);
		mav.addObject("memProfilePic", memProfilePic);
		
		mav.setViewName("mate/mateView");
		
		return mav;
	}
	
	//메이트 글 등록
	@RequestMapping("/mateWrite")
	public ModelAndView mateWrite(HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		ModelAndView mav = new ModelAndView();
//		PropensityVO pVO = service.mateSelect(userid); //메이트 성향
		PropensityVO pVO=memService.propMateSelect(userid);
		if(pVO==null) { //메이트 성향이 없을 경우?
		mav.setViewName("redirect:memberProEdit"); //성향수정 페이지로 이동
		}else { //메이트 성향이 있을 경우 id 기준으로 값 가져감
		MemberVO mVO = memService.memberSelect(userid);
		
		// 구
		String guArr[]=memService.gu();
		
		
		MemberVO vo=memService.memberSelect(userid);
		
		/* 구, 동 start */
		String[] area1=vo.getArea1().split(" "); // 희망 지역 1의 구
		String[] area2=null;
		String[] area3=null;
		if(vo.getArea2()!=null) {
			area2=vo.getArea2().split(" "); // 희망 지역 2의 구
			mav.addObject("selDong2", memService.dong(area2[0]));
		}
		if(vo.getArea3()!=null) {
			area3=vo.getArea3().split(" "); // 희망 지역 3의 구
			mav.addObject("selDong3", memService.dong(area3[0]));
		}
		mav.addObject("guArr", guArr); // 구
		mav.addObject("selDong1", memService.dong(area1[0]));
		/* 구, 동 end */
		
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
		
		// 구
		String guArr[]=memService.gu();
		
		MemberVO vo=memService.memberSelect(userid);
		
		/* 구, 동 start */
		String[] area1=vo.getArea1().split(" "); // 희망 지역 1의 구
		String[] area2=null;
		String[] area3=null;
		if(vo.getArea2()!=null) {
			area2=vo.getArea2().split(" "); // 희망 지역 2의 구
			mav.addObject("selDong2", memService.dong(area2[0]));
		}
		if(vo.getArea3()!=null) {
			area3=vo.getArea3().split(" "); // 희망 지역 3의 구
			mav.addObject("selDong3", memService.dong(area3[0]));
		}
		mav.addObject("guArr", guArr); // 구
		mav.addObject("selDong1", memService.dong(area1[0]));
		/* 구, 동 end */
	
		mav.addObject("vo", memService.memberSelect(userid));
		
		mav.setViewName("mate/mateEdit");
		return mav;
	}
	
	
	
	//메이트 수정 확인
	@RequestMapping(value = "/mateEditOk", method = RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView mateEditOk(MateWriteVO mVO, PropensityVO pVO, HttpServletRequest req, @RequestParam("filename") MultipartFile filename) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)req.getSession().getAttribute("logId");
		mVO.setUserid(userid);
		pVO.setUserid(userid);
		pVO.setPcase("m");
		
		System.out.println("mVO id->"+mVO.getUserid());
		
		
		
		//사진 수정
		String path = req.getSession().getServletContext().getRealPath("/housePic");
		String selFilename = service.MateProfilePic(userid, mVO.getNo()); //아이디, no
		String delFilename = req.getParameter("delFile");
		
		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)req;
		if(mr.getFile("filename")!=null) {
			MultipartFile newName=mr.getFile("filename");

			String newUpload="";
			
			if(newUpload!=null && newName!=null) {
				String orgname=newName.getOriginalFilename();
				
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
					System.out.println("리네임된 새로운 파일명 : "+newUpload);
				}
			}
			
		
		mVO.setMatePic1(newUpload);
		
		DefaultTransactionDefinition def=new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // 트랜잭션 호출
		TransactionStatus status=transactionManager.getTransaction(def);
		
		try {
			int result1 = service.mateUpdate(mVO);
			if(result1>0) {
				System.out.println("메이트 글 수정 완료");
				if(delFilename!=null) {
					try {
						File dFileObj=new File(path, delFilename);
						dFileObj.delete();
					}catch(Exception e) {
						System.out.println("글 수정 중 삭제할 파일 삭제 에러 발생");
						e.printStackTrace();
					}
				}
				
				pVO.setPno(mVO.getPno());
				int result2 = memService.propMateUpdate(pVO);
				if(result2>0) {
					System.out.println("메이트성향 수정 성공");
					if(delFilename!=null) {
						try {
							File dFileObj=new File(path, delFilename);
							dFileObj.delete();
						}catch(Exception e) {
							System.out.println("글 수정 중 삭제할 파일 삭제 에러 발생");
							e.printStackTrace();
						}
					}
					transactionManager.commit(status);
					mav.setViewName("redirect:mateIndex");
				}else {
					System.out.println("메이트성향 수정 실패");
					if(newUpload!=null && !newUpload.equals("")){ // 올리려는 새 이미지가 있을 때
						try {
							File dFileObj=new File(path, newUpload);
							dFileObj.delete();
						}catch(Exception e) {
							System.out.println("새로 업로드된 파일 지우기 에러 발생");
							e.printStackTrace();
						}
					}
					mav.setViewName("redirect:mateEdit");
				}
			}else {
				System.out.println("메이트 글 수정 실패");
				if(newUpload!=null && !newUpload.equals("")){ // 올리려는 새 이미지가 있을 때
					try {
						File dFileObj=new File(path, newUpload);
						dFileObj.delete();
					}catch(Exception e) {
						System.out.println("새로 업로드된 파일 지우기 에러 발생");
						e.printStackTrace();
					}
				}
			}
		}catch(Exception e) {
			System.out.println("메이트 글+성향 수정 실패");
			//사진 수정 트랜잭션 실행문
			if(newUpload!=null && !newUpload.equals("")){ // 올리려는 새 이미지가 있을 때
				try {
					File dFileObj=new File(path, newUpload);
					dFileObj.delete();
				}catch(Exception ee) {
					System.out.println("새로 업로드된 파일 지우기 에러 발생");
					ee.printStackTrace();
				}
			}
		
	}
	} //filename 종료
		
		return mav;
	}
	
	
	//메이트 삭제
	@RequestMapping("/mateDel")
	public ModelAndView mateDel(int no, MateWriteVO mVO, PropensityVO pVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		String userid = (String)req.getSession().getAttribute("logId");
		
		
			int result1 = service.mateDel(mVO.getNo(), userid);
			
			if(result1>0) { 
				System.out.println("메이트 삭제 성공");
				
				mav.setViewName("redirect:mateIndex");
			}else { 
				mav.addObject("no", no); //삭제 실패하면 no가지고 메이트 글 보기로 넘겨주기
				System.out.println("메이트 삭제 실패");
				mav.setViewName("redirect:mateView");
			}
		
		return mav;
	}
	

	
	
}
