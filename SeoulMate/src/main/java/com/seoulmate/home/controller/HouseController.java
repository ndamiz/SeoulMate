package com.seoulmate.home.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.HomeService;
import com.seoulmate.home.service.HouseService;
import com.seoulmate.home.service.ListService;
import com.seoulmate.home.service.MemberService;
import com.seoulmate.home.vo.HouseMatePagingVO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.ListVO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PropensityVO;

@Controller
public class HouseController {
	@Inject
	HouseService service;
	@Inject
	MemberService memService;
	@Inject
	ListService listService;
	@Inject
	HomeService HomeService;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@RequestMapping("/houseIndex")
	public ModelAndView houseIndex(HttpSession session, String addr, String rent, String deposit, String m_gen, String pageNum) {
		ModelAndView mav=new ModelAndView();
		String userid=(String)session.getAttribute("logId");
		
		int rentInt=0;
		if(rent!=null && !rent.equals("")) {
			rentInt=Integer.parseInt(rent);
		}
		
		int depositInt=0;
		if(deposit!=null && !deposit.equals("")) {
			depositInt=Integer.parseInt(deposit);
		}
		
		int m_genInt=0;
		if(m_gen!=null && !m_gen.equals("")) {
			m_genInt=Integer.parseInt(m_gen);
		}
		
		int pageNumInt=1;
		if(pageNum!=null && !pageNum.equals("")) {
			pageNumInt=Integer.parseInt(pageNum);
		}
        
        if(session.getAttribute("logId")!=null) {
			int logGrade=(Integer)session.getAttribute("logGrade");
			// 프리미엄일 때만
			if(logGrade==2) {
				// 메이트의 희망 성별 가져오기
				int matePnoCheck=listService.myMatePnoCheck(userid);
				
				mav.addObject("matePnoCheck", matePnoCheck); // 메이트 번호의 갯수를 반환한다.
				
				if(matePnoCheck>0) { // 메이트 성향이 있을 때만 매칭된 하우스 목록을 띄워준다.
					int m_gender=listService.mate_m_gender(userid);
					
					// 쉐어하우스 매칭 리스트 구하기
					List<ListVO> phList = listService.premiumHouseList(userid, m_gender, addr, rentInt, depositInt, m_genInt); // PremiumHouseList
					
					if(phList.size()>0) {
						if(phList.get(0)!=null){ // else if(phList!=null)
							HouseRoomVO phhrVO = new HouseRoomVO();
							for (ListVO phVO : phList) {
								int index=phVO.getAddr().indexOf(" ");
								String ad=phVO.getAddr().substring(index+1); // XX구 XX동 XX-XX XX
								
								int guIdx=ad.indexOf("구 ");
								
								String gu=ad.substring(0, guIdx+2); // 'XX구 ' 
								String gu1=ad.substring(guIdx+2); // 'XX동 XX-XX XX'
								
								int dongIdx=gu1.indexOf(" ");
								
								String dong=gu1.substring(0, dongIdx); // 'XX동'
								phVO.setAddr(gu+dong);
							}
							mav.addObject("phList", phList);
						}
					}
				}
				
			}
		}
        
        HouseMatePagingVO pVO=new HouseMatePagingVO();
        
        pVO.setAddr(addr);
        pVO.setRent(rentInt);
        pVO.setDeposit(depositInt);
        pVO.setM_gen(m_genInt);
        pVO.setPageNum(pageNumInt);
        pVO.setTotalRecode(service.HouseTotalRecode(pVO));
        
        // 쉐어하우스 최신리스트 구하기
		int MyMpnoCnt=0;
		if(session.getAttribute("logId")!=null) {
			if(listService.myMatePnoCheck(userid)>0) {
				MyMpnoCnt=listService.myMatePnoCheck(userid);
			}
		}
		
		List<HouseWriteVO> nhList = service.getNewIndexHouse(pVO); // 1. homeService 함수는 row<=3이고, HouseService는 row<=9
		HouseRoomVO hrVO = new HouseRoomVO();
		for (HouseWriteVO hwVO : nhList) {
			// 각 쉐어하우스의 제일 저렴한 월세 가져오기
			hrVO = HomeService.getDesposit(hwVO.getNo()); // 2. 이건 같아서 HomeService꺼 그대로 가져다 씀
			
			if(session.getAttribute("logId")!=null) {
				if((Integer)session.getAttribute("logGrade")==2) {
					if(MyMpnoCnt>0) {
						ListVO scoreVO=listService.premiumHouseScore(userid, hwVO.getPno());
						hwVO.setScore(scoreVO.getScore());
					}
				}
			}
			hwVO.setDeposit(hrVO.getDeposit());
			hwVO.setRent(hrVO.getRent());
			
			// 하우스 구, 동 띄우기
			int index=hwVO.getAddr().indexOf(" ");
			String ad=hwVO.getAddr().substring(index+1); // XX구 XX동 XX-XX XX
			
			int guIdx=ad.indexOf("구 ");
			
			String gu=ad.substring(0, guIdx+2); // 'XX구 ' 
			String gu1=ad.substring(guIdx+2); // 'XX동 XX-XX XX'
			
			int dongIdx=gu1.indexOf(" ");
			
			String dong=gu1.substring(0, dongIdx); // 'XX동'
			hwVO.setAddr(gu+dong);
		}
		
		mav.addObject("newHouseListCnt", nhList.size());
		mav.addObject("newHouseList", nhList);
		mav.addObject("pVO", pVO); // addr, rent, deposit, m_gen
		mav.setViewName("house/houseIndex");
	return mav;
	}
	
	@RequestMapping("/houseView")
	public ModelAndView houseView(int no, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");
		
		HouseWriteVO hVO = service.houseSelect2(no); //HouseWriteVO 값 가져오기
		List<HouseRoomVO> rVO_List = service.roomListSelect(no); //HouseRoomVO 값 가져오기
		PropensityVO pVO = service.propHouseSelect2(hVO.getPno()); //PropensityVO 값 가져오기
		String memProfilePic = service.memberProfile(hVO.getUserid());
		if(userid!=null) {
			// pcase 가 m 인건 1개뿐. 
			PropensityVO pVO_log = memService.propMateSelect(userid); //로그인한 사용자의 PropensityVO값 가져오기. (매칭용) 
			MemberVO mVO_log = memService.memberSelect(userid);//로그인한 사용자의 정보
			mav.addObject("pVO_log", pVO_log);
			mav.addObject("mVO_log", mVO_log);
			
			PropensityVO graph_matching = service.getMatchingSelect(pVO.getPno(), pVO_log.getPno());
			PropensityVO scoreVO = service.getMatchingScore(pVO.getPno(), pVO_log.getPno());
			graph_matching.setScore(scoreVO.getScore());
			mav.addObject("graph_matching", graph_matching);
		}
		// 하우스 pno, housename ,  메이트 pno  => 계산된 vo로 받아오기 . 
		mav.addObject("hVO", hVO);
		mav.addObject("rVO_List", rVO_List);
		mav.addObject("pVO", pVO);
		mav.addObject("memProfilePic", memProfilePic);
		
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
		
		//프리미엄 가입자인지 확인 grade : 2 -> 프리미엄 일 경우 등록한 글 갯수 확인 -> 최대 3개까지 가능
		//일반 grade : 1 -> 1개만 등록 가능
		int grade = service.gradeCheck(userid);
		if(grade==1) { //일반 등급 -> 무조건 1개 글 등록
			
		}else { //프리미엄 등급 -> 모집중인 글이 최종적으로 3개까지 등록 가능
			
		}
		
		if(houseCheck<0) { //하우스 등록 안했을 경우(가입할때 성향은 존재, 하우스 글 등록x)
			int housePno = service.housePnoCheck(userid); //pno(성향테이블 no) 값 가져오기
			mav.addObject("housePno", housePno);
		}else {
			mav.addObject("housePno", 0); //하우스 글이 없을경우 pno 에 0 값을 넣어줌
		}
		if(pcaseH>0) {
			mav.addObject("list", service.getPropInfo(userid)); //사용자가 등록해 놓은 성향 이름 불러오기
		}
		mav.setViewName("house/houseWrite");
		return mav;
	}
	//하우스 등록시 선택한 성향 불러오기
	@RequestMapping("/getPropensity")
	@ResponseBody
	public PropensityVO getPropensity(PropensityVO pVO, String userid, int pno){
		System.out.println(pno);
		return service.getFullPropensity(userid, pno); //불러온 이름중에서 선택한 성향 값 가져오기
	}
	//하우스 글 등록 확인
	@RequestMapping(value="/houseWriteOk", method = RequestMethod.POST)
	@Transactional(rollbackFor= {Exception.class, RuntimeException.class})
	public ModelAndView houseWriteOk(HouseWriteVO hVO, HouseRoomVO rVO, PropensityVO pVO, 
				@RequestParam("filename") MultipartFile img1, HttpSession session ,HttpServletRequest req,
				 @RequestParam("filename2") MultipartFile img2, @RequestParam("filename3") MultipartFile img3,
				 @RequestParam("filename4") MultipartFile img4,  @RequestParam("filename5") MultipartFile img5) {
		
		System.out.println(pVO.getPno());
		String userid=(String)session.getAttribute("logId");
		
		System.out.println(rVO.getRoomVOList().get(0).getDeposit()+"?????????????");
		
		hVO.setUserid(userid);
//		rVO.setUserid(userid);
		pVO.setUserid(userid);
		pVO.setPcase("h");
		
//		System.out.println("hVO"+hVO.getPno());
//		System.out.println("pVO"+pVO.getPno());
		
		//사진 업로드		
		String path = req.getSession().getServletContext().getRealPath("/housePic"); //파일 저장위치 절대경로 구하기

		String filename1 = img1.getOriginalFilename(); // 기존 파일 명
		String realName = "";
	
		 
		try {
			if(filename1 != null && !filename1.equals("")) {
				File f=new File(path, filename1);
				int i = 1;
				while(f.exists()) {
					int point = filename1.lastIndexOf(".");
					String name = filename1.substring(0, point);
					String extName = filename1.substring(point+1);
					
					f = new File(path, name+"_"+ i++ +"."+extName);
				}
				img1.transferTo(f); // 업로드
				
				realName = f.getName();
				
				hVO.setHousepic1(f.getName());
			}
		}catch(Exception e) {
			System.out.println("하우스 사진 업로드 에러 발생");
			e.printStackTrace();
		}
		
		String filename2 = img2.getOriginalFilename();
		int j = 1;
		if(filename2!=null && !filename2.equals("")) {
			File f2 = new File(path, filename2);
			while(f2.exists()) {
				
				int point2 = filename2.lastIndexOf(".");
				String name2 = filename2.substring(0, point2);
				String extName2 = filename2.substring(point2+1);
				
				f2 = new File(path, name2+"_"+(j++)+"."+extName2);
			}
			try {
				if(filename2!=null && !filename2.equals("")) {
					img2.transferTo(f2);
				}
			} catch(Exception e) {
				System.out.println("filename2 업로드 에러 발생");
			}
			
			realName = f2.getName();
			hVO.setHousepic2(f2.getName());
		}
		
		String filename3 = img3.getOriginalFilename();
		int k = 1;
		if(filename2!=null && !filename3.equals("")) {
			File f3 = new File(path, filename3);
			while(f3.exists()) {
				
				int point3 = filename3.lastIndexOf(".");
				String name3 = filename3.substring(0, point3);
				String extName3 = filename3.substring(point3+1);
				
				f3 = new File(path, name3+"_"+(k++)+"."+extName3);
			}
			try {
				if(filename3!=null && !filename3.equals("")) {
					img3.transferTo(f3);
				}
			} catch(Exception e) {
				System.out.println("filename3 업로드 에러 발생");
			}
			
			realName = f3.getName();
			hVO.setHousepic3(f3.getName());
		}
		
		String filename4 = img4.getOriginalFilename();
		int l = 1;
		if(filename4!=null && !filename4.equals("")) {
			File f4 = new File(path, filename4);
			while(f4.exists()) {
				
				int point4 = filename4.lastIndexOf(".");
				String name4 = filename4.substring(0, point4);
				String extName4 = filename4.substring(point4+1);
				
				f4 = new File(path, name4+"_"+(j++)+"."+extName4);
			}
			try {
				if(filename4!=null && !filename4.equals("")) {
					img4.transferTo(f4);
				}
			} catch(Exception e) {
				System.out.println("filename4 업로드 에러 발생");
			}
			
			realName = f4.getName();
			hVO.setHousepic4(f4.getName());
		}
		
		String filename5 = img5.getOriginalFilename();
		int m = 1;
		if(filename5!=null && !filename5.equals("")) {
			File f5 = new File(path, filename5);
			while(f5.exists()) {
				
				int point5 = filename5.lastIndexOf(".");
				String name5 = filename5.substring(0, point5);
				String extName5 = filename5.substring(point5+1);
				
				f5 = new File(path, name5+"_"+(m++)+"."+extName5);
			}
			try {
				if(filename5!=null && !filename5.equals("")) {
					img5.transferTo(f5);
				}
			} catch(Exception e) {
				System.out.println("filename5 업로드 에러 발생");
			}
			
			realName = f5.getName();
			hVO.setHousepic5(f5.getName());
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
					//System.out.println("하우스 등록 시도 에러 확인"+pVO.getPno());
					
					String houseName = hVO.getHousename(); //성향의 housename을 housewrite의 테이블의 housename의 값으로 설정
					System.out.println("하우스확인"+houseName);
					int houseUpdate = service.housenameUpdate(houseName, pVO.getPno()); 
					
					if(houseUpdate>0) {
						System.out.println("하우스네임 업데이트 성공");
						//===test
						int result3 = 0;
						for(int i=0; i<rVO.getRoomVOList().size(); i++) {
							if(rVO.getRoomVOList().get(i).getRoomName() != null) {
								rVO.getRoomVOList().get(i).setUserid(userid);
								result3 = service.roomInsert(rVO.getRoomVOList().get(i));
							}
						}
						//===test
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
	public ModelAndView houseEdit(@RequestParam(value="no") int no, HouseWriteVO hVO, HouseRoomVO rVO, PropensityVO pVO, HttpSession session, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)session.getAttribute("logId");

		System.out.println(rVO.getEnterdate());
		// <a href="boardEdit?no=${vo.no }">수정</a> 수정할때 글의 번호 가져오기
		
		hVO.setUserid(userid);
		rVO.setUserid(userid);
		pVO.setUserid(userid);
		pVO.setPcase("h");
		System.out.println("hVO id->"+hVO.getUserid());

		System.out.println(no); 
//		int num=Integer.parseInt(no);
//		System.out.println(num);
//		System.out.println("hVO->"+hVO.getNo());
		hVO = service.houseSelect(no, userid);

		rVO.setNo(hVO.getNo());
		System.out.println("rVO no-> "+rVO.getNo());
		rVO = service.roomSelect(no, userid);
		pVO = service.propHouseSelect(userid, hVO.getPno());
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
		
		System.out.println("Str-> "+hVO.getPublicfacilityStr());	
		System.out.println("공용-> "+hVO.getPublicfacility());
		
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
		String selFilename = service.houseProfilePic(userid, hVO.getNo()); //아이디, no
		String delFilename = req.getParameter("delFile");
		String selFilename2 = service.houseProfilePic2(userid, hVO.getNo());
		String delFilename2 = req.getParameter("delFile2");
//		
//		System.out.println(selFilename);
//		System.out.println(selFilename2);
		
		hVO = service.houseSelect(hVO.getNo(), userid);
		
		//DB의 파일명을 가져온다
		
		List<String> selFile = new ArrayList<String>();
		selFile.add(hVO.getHousepic1());
		if(hVO.getHousepic2()!=null && !hVO.getHousepic2().equals("")) {
			selFile.add(hVO.getHousepic2());
		}
		if(hVO.getHousepic3()!=null && !hVO.getHousepic3().equals("")) {
			selFile.add(hVO.getHousepic3());
		}
		if(hVO.getHousepic4()!=null && !hVO.getHousepic4().equals("")) {
			selFile.add(hVO.getHousepic4());
		}
		if(hVO.getHousepic5()!=null && !hVO.getHousepic5().equals("")) {
			selFile.add(hVO.getHousepic5());
		}
		
		
		//삭제한 파일 가져오기
		String delFile[] = req.getParameterValues("delFile"); //파일 수정하여 삭제한 파일을 배열로 받아온다
		
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
	    List<MultipartFile> list = mr.getFiles("filename");//업로드된 파일목록을가져온다
		
	    List<String> newUpload = new ArrayList<String>();
		if(newUpload!=null && list.size()>0) { //새로 수정되어 업로드 된 파일이 있는 경우
			for(MultipartFile mf : list) {
				if(mf!=null) {
					String orgname = mf.getOriginalFilename(); //원(기존)파일명
					if(orgname!=null && !orgname.equals("")) {
						File ff = new File(path, orgname);
						int i = 0;
						while(ff.exists()) {
							int pnt = orgname.lastIndexOf("."); //마지막 . 의 위치 구하기
							String firstName = orgname.substring(0, pnt); //파일명 구하기
							String extName = orgname.substring(pnt+1); //확장자 구하기
							
							ff = new File(path, firstName+"("+ ++i +")."+extName);
						}
						try {
							mf.transferTo(ff); //파일 업로드
						}catch(Exception e) {
							System.out.println("새로 추가 업로드 에러");
							e.printStackTrace();
						}
						newUpload.add(ff.getName());
						
					}//if문 종료
				}//if문 종료
			}//for문 종료
		}//if문 종료
		
		//DB선택파일 목록에서 삭제한 파일 지우기 -> 최종적으로 DB에 올라갈 파일을 제외한 나머지 파일 삭제
		if(delFile!=null) { //삭제할 파일이 있는 경우
			for(String delName : delFile) {
				selFile.remove(delName); //delName -> 삭제할 파일명
				
			}
		}
		
		//DB선택파일 목록에서 새로 업로드 된 파일명 추가하기
		for(String newFile : newUpload) {
			selFile.add(newFile); //newFile -> 새로 업로드 할 파일명
		}
		hVO.setHousepic1(selFile.get(0));
		
		if(selFile.size()>1) { //filename2 있을 경우
			hVO.setHousepic2(selFile.get(1));
		}
		
		if(selFile.size()>2) { //filename3 있을 경우
			hVO.setHousepic3(selFile.get(2));
		}
		
		if(selFile.size()>3) { //filename4 있을 경우
			hVO.setHousepic4(selFile.get(3));
		}
		
		if(selFile.size()>4) { //filename5 있을 경우
			hVO.setHousepic5(selFile.get(4));
		}

		
		
		
//		
//		MultipartHttpServletRequest mr=(MultipartHttpServletRequest)req;
//		if(mr.getFile("filename")!=null) {
//			MultipartFile newName=mr.getFile("filename");
//
//			String newUpload="";
//			
//			if(newUpload!=null && newName!=null) {
//				String orgname=newName.getOriginalFilename();
//				
//				if(orgname!=null && !orgname.equals("")) {
//					File ff=new File(path, orgname);
//					int i=1;
//					while(ff.exists()) {
//						int pnt=orgname.lastIndexOf(".");
//						String firstName=orgname.substring(0, pnt);
//						String extName=orgname.substring(pnt+1);
//						
//						ff=new File(path, firstName+"_"+ i++ +"."+extName);
//					}
//					try {
//						newName.transferTo(ff);
//					}catch(Exception e) {
//						System.out.println("새로운 파일 추가 수정 에러 발생");
//						e.printStackTrace();
//					}
//					newUpload=ff.getName();
//					System.out.println("리네임된 새로운 파일명 : "+newUpload);
//				}
//			}
//			
		
//		hVO.setHousepic1(newUpload);
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // 트랜잭션 호출
		TransactionStatus status=transactionManager.getTransaction(def);
		
		try {
			System.out.println("하우스테이블 no 1확인:"+hVO.getNo());
//			hVO.setNo(3);
//			hVO.setPno(22);
			hVO.setPno(pVO.getPno());
			System.out.println("하우스테이블 no 2확인:"+hVO.getNo());
			System.out.println("하우스 테이블 pno 확인:"+hVO.getPno());
			pVO.setPno(hVO.getPno());
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
					if(delFile!=null ) { //삭제한 파일 지우고 글 내용보기로 돌아가기
						for(String dFile : delFile) {
							try {
								File dFileObj = new File(path, dFile);
								dFileObj.delete();
							}catch(Exception e) {
								System.out.println("파일명 추가 에러");
								e.printStackTrace();
								
							}
						}
					}
					pVO.setPno(hVO.getPno());
					int result3 = service.propHouseUpdate(pVO);
					if(result3>0) {
						System.out.println("성향 수정 성공");
//						if(delFilename!=null) {
//							try {
//								File dFileObj=new File(path, delFilename);
//								dFileObj.delete();
//							}catch(Exception e) {
//								System.out.println("글 수정 중 삭제할 파일 삭제 에러 발생");
//								e.printStackTrace();
//							}
//						}
						if(delFile!=null ) { //삭제한 파일 지우고 글 내용보기로 돌아가기
							for(String dFile : delFile) {
								try {
									File dFileObj = new File(path, dFile);
									dFileObj.delete();
								}catch(Exception e) {
									System.out.println("파일명 추가 에러");
									e.printStackTrace();
									
								}
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
						
						mav.setViewName("redirect:houseEdit");
						if(newUpload.size()>0) { //새로 업로드 하려 했던 파일 지우고 다시 수정form으로 이동
							for(String newFile : newUpload) {
								try {
									File dFileObj = new File(path, newFile);
									dFileObj.delete();
								}catch(Exception e) {
									System.out.println("수정 실패");
									e.printStackTrace();
								}
							}
						}
					}
				}else {
					System.out.println("방 수정 실패");
//					if(newUpload!=null && !newUpload.equals("")){ // 올리려는 새 이미지가 있을 때
//						try {
//							File dFileObj=new File(path, newUpload);
//							dFileObj.delete();
//						}catch(Exception e) {
//							System.out.println("새로 업로드된 파일 지우기 에러 발생");
//							e.printStackTrace();
//						}
//					}
					
				}
			}else {
				System.out.println("하우스 업데이트 실패");
			
				mav.setViewName("redirect:houseEdit");
			}

		}catch(Exception e) {
			System.out.println("하우스+방 수정 실패 (트랜잭션)");
			e.printStackTrace();
			//사진 수정 트랜잭션 작성부분
			if(newUpload.size()>0) { //새로 업로드 하려 했던 파일 지우고 다시 수정form으로 이동
				for(String newFile : newUpload) {
					try {
						File dFileObj = new File(path, newFile);
						dFileObj.delete();
					}catch(Exception ee) {
						System.out.println("수정 실패");
						ee.printStackTrace();
					}
				}
			}

			
//		}
		} //filename 종료
		return mav;
	}
	
	
	//하우스 삭제 -> 성향은 제외하고 houseWrite, houseRoom 만 삭제, Propensity 의 housename을 null 로 업데이트
	@RequestMapping("/houseDel")
	public ModelAndView houseDel(int no, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		String userid = (String)req.getSession().getAttribute("logId");
//		hVO.setUserid(userid);
//		rVO.setUserid(userid);
//		pVO.setUserid(userid);
		
		HouseWriteVO hVO = service.houseSelect(no, userid);
		HouseRoomVO rVO = service.roomSelect(no, userid);
		PropensityVO pVO = service.propHouseSelect(userid, hVO.getPno());
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(DefaultTransactionDefinition.PROPAGATION_REQUIRED); // 트랜잭션 호출
		TransactionStatus status=transactionManager.getTransaction(def);
		
		try {
			int result1 = service.houseDel(no, userid);
			if(result1>0) {
				System.out.println("하우스 삭제 성공");
				
				rVO.setNo(hVO.getNo());
				int result2 = service.roomDel(no, userid);
				if(result2>0) {
					System.out.println("룸 삭제 성공");
					
					pVO.setPno(hVO.getPno());
					int result3 = service.ProHouseNameUpdate(pVO);
					if(result3>0) {
						System.out.println("하우스네임 업데이트 성공");
						transactionManager.commit(status);
						mav.setViewName("redirect:houseIndex");
						
					}else {
						System.out.println("하우스네임 업데이트 실패");
						mav.addObject("no", no);
						mav.setViewName("redirect:houseView");
					}
				}else {
					System.out.println("룸 삭제 실패");
				}
			}else {
				System.out.println("하우스 삭제 실패");
			}
			
		}catch(Exception e) {
			System.out.println("하우스 + 룸 삭제 실패");
			e.printStackTrace();
			mav.setViewName("redirect:houseView");
		}
		return mav;
	}
	
	@RequestMapping("/houseMatching")
	public ModelAndView houseMatching(HttpSession session, String addr, String rent, String deposit, String m_gen, String pageNum) {
		ModelAndView mav=new ModelAndView();
		String userid=(String)session.getAttribute("logId");
		HouseMatePagingVO pVO=new HouseMatePagingVO();
		
		int rentInt=0;
		if(rent!=null && !rent.equals("")) {
			rentInt=Integer.parseInt(rent);
		}
		
		int depositInt=0;
		if(deposit!=null && !deposit.equals("")) {
			depositInt=Integer.parseInt(deposit);
		}
		
		int m_genInt=0;
		if(m_gen!=null && !m_gen.equals("")) {
			m_genInt=Integer.parseInt(m_gen);
		}
		
		int pageNumInt=1;
		if(pageNum!=null && !pageNum.equals("")) {
			pageNumInt=Integer.parseInt(pageNum);
		}
        
        if(session.getAttribute("logId")!=null) {
			int logGrade=(Integer)session.getAttribute("logGrade");
			// 프리미엄일 때만
			if(logGrade==2) {
				// 메이트의 희망 성별 가져오기
				int matePnoCheck=listService.myMatePnoCheck(userid);
				
				mav.addObject("matePnoCheck", matePnoCheck); // 메이트 번호의 갯수를 반환한다.
				
				if(matePnoCheck>0) { // 메이트 성향이 있을 때만 매칭된 하우스 목록을 띄워준다.
					int m_gender=listService.mate_m_gender(userid);
					
					pVO.setUserid(userid);
			        pVO.setAddr(addr);
			        pVO.setRent(rentInt);
			        pVO.setDeposit(depositInt);
			        pVO.setM_gen(m_genInt);
			        pVO.setM_gender(m_gender);
			        pVO.setPageNum(pageNumInt);
			        pVO.setTotalRecode(service.houseMatchTotal(pVO));
					// 쉐어하우스 매칭 리스트 구하기
					List<ListVO> phList = service.HouseMatchList(pVO); // PremiumHouseList
					
					if(phList.size()>0) {
						if(phList.get(0)!=null){ // else if(phList!=null)
							HouseRoomVO phhrVO = new HouseRoomVO();
							for (ListVO phVO : phList) {
								// 하우스 구, 동 띄우기
								int index=phVO.getAddr().indexOf(" ");
								String ad=phVO.getAddr().substring(index+1); // XX구 XX동 XX-XX XX
								
								int guIdx=ad.indexOf("구 ");
								
								String gu=ad.substring(0, guIdx+2); // 'XX구 ' 
								String gu1=ad.substring(guIdx+2); // 'XX동 XX-XX XX'
								
								int dongIdx=gu1.indexOf(" ");
								
								String dong=gu1.substring(0, dongIdx); // 'XX동'
								phVO.setAddr(gu+dong);
							}
							mav.addObject("phList", phList);
						}
					}
				}
			}
        }
        
        mav.addObject("pVO", pVO);
        mav.setViewName("house/houseMatching");
        
        return mav;
	}
	
	
}
