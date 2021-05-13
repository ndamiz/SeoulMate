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
	public ModelAndView houseSearch(HouseWriteVO hVO, HouseRoomVO rVO, PropensityVO pVO, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("house/houseView");
		
		return mav;
	}
	
	//하우스 글 등록
	@RequestMapping("/houseWrite")
	public ModelAndView houseWirte(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid=(String)session.getAttribute("logId");
		int pcaseH = memService.propPcaseH(userid);
		int houseCheck = service.houseCheck(userid);
		if(houseCheck==0) { //하우스 등록 안했을 경우
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
		System.out.println("pno확인"+session.getAttribute("housePno"));
		String userid=(String)session.getAttribute("logId");
		pVO.setPno(service.proPnoCheck(userid));
		
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
			int result1 = service.propInsert(pVO);
			pVO.setPno(service.proPnoCheck(userid));
			System.out.println("성향 insert 값 확인->"+result1);
			System.out.println("아이디:"+pVO.getUserid());
			System.out.println("케이스 확인:"+pVO.getPcase());
			System.out.println("p넘버:"+pVO.getPno());
			if(result1>0) { //성향 등록 
				System.out.println("성향 등록 성공");
				
				int proPnoCheck = service.proPnoCheck(userid); //pno 값 확인 (psq.currval 값)
				hVO.setPno(proPnoCheck); //성향은 있지만 house가 없기때문에 house의 pno에 이미 존재하는 성향테이블 pno(psq.currval)값 을 넣어줌
				int result2 = service.houseInsert(hVO);
				
				if(result2>0) { //집(house) 등록 
					System.out.println("하우스 등록 성공");

					if(hVO.getPno()!=0) { //house 테이블의 pno가 0이 아닐때는-> pno(성향 테이블) 이미 존재 -> 성향 업데이트
						System.out.println("성향 업데이트 시도");
						 //존재하는 성향테이블 pno 값 확인
						
						int result4 = service.propHouseUpdate(pVO); //성향 수정
						
						if(result4>0) {
							System.out.println("성향 업데이트 성공");
							int result3 = service.roomInsert(rVO);
							if(result3>0) {
								System.out.println("방 등록 성공");
								transactionManager.commit(status);
								mav.setViewName("redirect:houseIndex");
							}
						}
					}else { // hVO.getPno가 0일 경우 -> 하우스테이블의 pno가 없을 경우 
						
						int result3 = service.roomInsert(rVO); 
						if(result3>0) { //방(room) 등록
							System.out.println("방 등록 성공");
							transactionManager.commit(status);
							mav.setViewName("redirect:houseIndex");
						}else {
							System.out.println("방 등록실패");
						}
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
	public String houseEdit() {
		return "house/houseEdit";
	}
}
