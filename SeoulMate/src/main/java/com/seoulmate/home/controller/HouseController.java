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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.dao.HouseWriteDAO;
import com.seoulmate.home.service.HouseService;
import com.seoulmate.home.service.MemberService;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PropensityVO;

@Controller
public class HouseController {
	@Inject
	HouseService service;
	@Inject
	MemberService memService;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/houseIndex")
	public String houseIndex() {
	return "house/houseIndex";
	}
	
	@RequestMapping("/houseView")
	public ModelAndView houseSearch(int no, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		
		HouseWriteVO hVO = service.houseSelect(no, userid); //HouseWriteVO 값 가져오기
		HouseRoomVO rVO = service.roomSelect(no, userid); //HouseRoomVO 값 가져오기
		PropensityVO pVO = service.propHouseSelect(userid, hVO.getPno()); //PropensityVO 값 가져오기
		
		mav.addObject("hVO", hVO);
		mav.addObject("rVO", rVO);
		mav.addObject("pVO", pVO);
		
		mav.setViewName("house/houseView");
		
		return mav;
	}
	
	//하우스 글 등록
	@RequestMapping("/houseWrite")
	public ModelAndView houseWirte(HttpSession session, PropensityVO pVO, HouseWriteVO hVO) {
		ModelAndView mav = new ModelAndView();
		String userid=(String)session.getAttribute("logId");
		pVO = service.propHouseSelect(userid, pVO.getPno());
		hVO = service.houseSelect(hVO.getNo(), userid);
		
		mav.addObject("hVO", hVO);
		mav.addObject("pVO", pVO);
		int pcaseH = memService.propPcaseH(userid);
		int houseCheck = service.houseCheck(userid);
		if(houseCheck<0) { //하우스 등록 안했을 경우(가입할때 성향은 존재, 하우스 글 등록x)
			int housePno = service.housePnoCheck(userid); //pno(성향테이블 no) 값 가져오기
			mav.addObject("housePno", housePno);
		}else {
			mav.addObject("housePno", 0); //하우스 글이 없을경우 pno 에 0 값을 넣어줌
		}
		if(pcaseH>0) {
			mav.addObject("list", memService.houseList(userid));
		}
		
		mav.setViewName("house/houseWrite");
		
		return mav;
	}
	
	//하우스 글 등록 확인
	@RequestMapping(value="/houseWriteOk", method = RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView houseWriteOk(HouseWriteVO hVO, HouseRoomVO rVO, PropensityVO pVO, @RequestParam("filename") MultipartFile filename, HttpSession session ,HttpServletRequest req) {
		System.out.println(pVO.getPno());
		String userid=(String)session.getAttribute("logId");
		
		
		hVO.setUserid(userid);
		rVO.setUserid(userid);
		pVO.setUserid(userid);
		pVO.setPcase("h");
		
//		System.out.println("hVO"+hVO.getPno());
//		System.out.println("pVO"+pVO.getPno());
		
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
				hVO.setHousepic1(f.getName());
			}
		}catch(Exception e) {
			System.out.println("하우스 사진 업로드 에러 발생");
			e.printStackTrace();
		}
		
		ModelAndView mav = new ModelAndView();
		
		DefaultTransactionDefinition def=new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // 트랜잭션 호출
		TransactionStatus status=transactionManager.getTransaction(def);
		
		try {
			int result1 = 0;
			System.out.println("0->"+pVO.getPno());
			if(pVO.getPno()==0) { //성향 테이블이 존재하지 않음 -> 성향 등록
				System.out.println("1->"+pVO.getPno());
				result1 = service.propInsert(pVO);
				pVO.setPno(service.proPnoCheck(userid));
				System.out.println("2->"+pVO.getPno());
				System.out.println("성향 등록 시도");
			}else { //성향 테이블이 이미 존재 -> 성향 업데이트
				System.out.println("3->"+pVO.getPno());
				result1 = service.propHouseUpdate(pVO);
				System.out.println("성향 업데이트 시도");
			}
			
			System.out.println("성향 insert 값 확인->"+result1);
			System.out.println("아이디:"+pVO.getUserid());
			System.out.println("케이스 확인:"+pVO.getPcase());
			System.out.println("4 p넘버:"+pVO.getPno());
			if(result1>0) { //성향 등록 
				System.out.println("성향 등록 성공");
				System.out.println("hVO="+hVO.getHousename());
				hVO.setPno(pVO.getPno());
				int result2 = service.houseInsert(hVO);
				
				if(result2>0) { //집(house) 등록 
					System.out.println("하우스 등록 성공");
					System.out.println("하우스 등록 시도 에러 확인"+pVO.getPno());
					
					String houseName = hVO.getHousename(); //성향의 housename을 housewrite의 테이블의 housename의 값으로 설정
					System.out.println("하우스확인"+houseName);
					int houseUpdate = service.housenameUpdate(houseName, pVO.getPno()); 
					
					if(houseUpdate>0) {
						System.out.println("하우스네임 업데이트 성공");
						int result3 = service.roomInsert(rVO);
						if(result3>0) {
							System.out.println("방 등록 성공");
							
//							 int myHousePnoCnt=listService.myHousePnoCount(userid);
//					         if(myHousePnoCnt>0) {
//					            int newHpno=listService.newHpno(userid); // 내 최신 하우스 성향을 세션에 저장한다.
//					            session.setAttribute("hPno", newHpno);
//					         }
							
							transactionManager.commit(status);
							mav.setViewName("redirect:houseIndex");
						}else {
							System.out.println("방 등록 실패");
						}
					}else {
						System.out.println("하우스네임 업데이트 실패");
					}
				}else {
					System.out.println("하우스 등록 실패");
				}
			}else {
				if(realName!=null) {
					File f = new File(path, realName);
					f.delete();
				}
				System.out.println("성향 등록 실패");
				mav.setViewName("redirect:houseWrite");
			}
		}catch(Exception e) {
			System.out.println("쉐어하우스 글 등록 에러 발생 (트랜잭션)");
			e.printStackTrace();
			try { //파일업로드 트랜잭션
				File dFileObj = new File(path, realName);
				dFileObj.delete();
			}catch(Exception ee) {
				System.out.println("파일업로드 실패 (트랜잭션) 실행");
				ee.printStackTrace();				
			}
			mav.setViewName("redirect:houseWrite");
		}
		
		return mav;
	};
	
	
	//하우스 등록 수정
	@RequestMapping("/houseEdit")
	public ModelAndView houseEdit( HouseWriteVO hVO, HouseRoomVO rVO, PropensityVO pVO, HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		
		// <a href="boardEdit?no=${vo.no }">수정</a> 수정할때 글의 번호 가져오기
		
		hVO.setUserid(userid);
		rVO.setUserid(userid);
		pVO.setUserid(userid);
		pVO.setPcase("h");
		System.out.println("hVO id->"+hVO.getUserid());

//		System.out.println("hVO->"+hVO.getNo());
		hVO = service.houseSelect(3, userid);
		//int no -> VO와 같이 넣어주기
		//hVO = service.houseSelect(no, userid); 로 ?
		
		rVO = service.roomSelect(3, userid);
		pVO = service.propHouseSelect(userid, 22);
//		System.out.println("성향 타입-> "+pVO.getPcase());
//		System.out.println("성향 pno-> "+pVO.getPno());
		System.out.println("hVO Pno-> "+hVO.getPno());
		
		
		System.out.println(hVO.getUserid());
		System.out.println("하우스 no "+hVO.getNo());
		System.out.println("성향 번호 "+hVO.getPno());
		System.out.println("방 no "+rVO.getNo());
		System.out.println("방의 hno "+rVO.getHno());
		System.out.println("방 이름"+rVO.getRoomName());
		System.out.println("성향 소음:"+pVO.getH_noise());
		
		mav.addObject("hVO", hVO);
		mav.addObject("rVO", rVO);
		mav.addObject("pVO", pVO);
		
		
		
		
		
		
		mav.setViewName("house/houseEdit");
		return mav;
	}
	
	
	
	//하우스 수정 확인
	@RequestMapping(value="/houseEditOk", method = RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView houseEditOk(HouseWriteVO hVO, HouseRoomVO rVO, PropensityVO pVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)req.getSession().getAttribute("logId");
		hVO.setUserid(userid);
		rVO.setUserid(userid);
		pVO.setUserid(userid);
				
		//사진 수정
		String path = req.getSession().getServletContext().getRealPath("/housePic");
		String selFilename = service.houseProfile(userid, hVO.getNo()); //아이디, no
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
			
		
		hVO.setHousepic1(newUpload);
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // 트랜잭션 호출
		TransactionStatus status=transactionManager.getTransaction(def);
		
		try {
			System.out.println("하우스테이블 no 1확인:"+hVO.getNo());
			hVO.setNo(3);
			hVO.setPno(22);
			System.out.println("하우스테이블 no 2확인:"+hVO.getNo());
			System.out.println("하우스 테이블 pno 확인:"+hVO.getPno());
			int result1 = service.houseUpdate(hVO);
			if(result1>0) {
				System.out.println("하우스 업데이트 성공");
//				if(delFilename!=null) {
//					try {
//						File dFileObj=new File(path, delFilename);
//						dFileObj.delete();
//					}catch(Exception e) {
//						System.out.println("글 수정 중 삭제할 파일 삭제 에러 발생");
//						e.printStackTrace();
//					}
//				}
				System.out.println(hVO.getNo());
				rVO.setNo(hVO.getNo()); //houseWrite의 no을 houseRoom의 no(하우스번호)로 서정
				int result2 = service.roomUpdate(rVO);
				if(result2>0) {
					System.out.println("방 수정 성공");
					if(delFilename!=null) {
						try {
							File dFileObj=new File(path, delFilename);
							dFileObj.delete();
						}catch(Exception e) {
							System.out.println("글 수정 중 삭제할 파일 삭제 에러 발생");
							e.printStackTrace();
						}
					}
					pVO.setPno(hVO.getPno());
					int result3 = service.propHouseUpdate(pVO);
					if(result3>0) {
						System.out.println("성향 수정 성공");
						if(delFilename!=null) {
							try {
								File dFileObj=new File(path, delFilename);
								dFileObj.delete();
							}catch(Exception e) {
								System.out.println("글 수정 중 삭제할 파일 삭제 에러 발생");
								e.printStackTrace();
							}
						}
						
//						 int myHousePnoCnt=listService.myHousePnoCount(userid);
//				         if(myHousePnoCnt>0) {
//				            int newHpno=listService.newHpno(userid); // 내 최신 하우스 성향을 세션에 저장한다.
//				            session.setAttribute("hPno", newHpno);
//				         }
						
						transactionManager.commit(status);
						mav.setViewName("redirect:houseIndex");
						
					}else {
						System.out.println("성향 수정 실패");
						if(newUpload!=null && !newUpload.equals("")){ // 올리려는 새 이미지가 있을 때
							try {
								File dFileObj=new File(path, newUpload);
								dFileObj.delete();
							}catch(Exception e) {
								System.out.println("새로 업로드된 파일 지우기 에러 발생");
								e.printStackTrace();
							}
						}
						mav.setViewName("redirect:houseEdit");
					}
				}else {
					System.out.println("방 수정 실패");
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
			}else {
				System.out.println("하우스 업데이트 실패");
			
				mav.setViewName("redirect:houseEdit");
			}

		}catch(Exception e) {
			System.out.println("하우스+방 수정 실패 (트랜잭션)");
			e.printStackTrace();
			//사진 수정 트랜잭션 작성부분
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
	
	
	//하우스 삭제 -> 글이 2개 이상일때는 하우스,룸,성향 모두 함께 삭제, 글이 1개 이하일때는 성향은 남겨둬야함
	//성향은 제외하고 houseWrite, houseRoom 만 삭제, Propensity 의 housename을 null 로 업데이트
	@RequestMapping("/houseDel")
	public ModelAndView houseDel(HouseWriteVO hVO, HouseRoomVO rVO, PropensityVO pVO, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)req.getSession().getAttribute("logId");
		hVO.setUserid(userid);
		rVO.setUserid(userid);
		pVO.setUserid(userid);
		
		int result1 = service.houseDel(hVO);
		if(result1>0) {
			System.out.println("하우스 삭제");
			
			rVO.setNo(hVO.getNo()); //HouseRoom 의 no을 HouseWrite의 no으로 설정
		}else {
			System.out.println("하우스 삭제 실패");
		}
		
		return mav;
	}
	
	
}
