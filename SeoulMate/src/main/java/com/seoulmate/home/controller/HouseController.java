package com.seoulmate.home.controller;

import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.seoulmate.home.service.HouseService;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.PropensityVO;

@Controller
public class HouseController {
	@Inject
	HouseService service;
	
	@RequestMapping("/houseIndex")
	public String houserIndex() {
	return "house/houseIndex";
	}
	
	@RequestMapping("/houseView")
	public String houseSearch() {
		return "house/houseView";
	}
	
	//하우스 글 등록
	@RequestMapping("/houseWrite1")
	public String houseWirte1() {
		return "house/houseWrite1";
	}
	
	//하우스 글 등록 확인
	@RequestMapping(value="/houseWriteOk", method = RequestMethod.POST)
	public ModelAndView houseWriteOk(HouseWriteVO hVo, HouseRoomVO rVO, PropensityVO pVO, @RequestParam("filename") MultipartFile filename, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		
		// 프로필 사진 업로드 /////////////////////
				String profPath=req.getSession().getServletContext().getRealPath("/img/house/house02.jpg");
//				String orgName=filename.getOriginalFilename(); // 기존 파일 명
//				String realName="";
				
		//첨부파일 받아오기
				MultipartHttpServletRequest housePic = (MultipartHttpServletRequest)req;
				MultipartFile houseImg = housePic.getFile("housePic1");
				String uploadPic = "";
				
				if(houseImg!=null) {
					String originName = houseImg.getOriginalFilename();
					if(!originName.equals("")) {
						File uploadFile = new File(profPath, originName);
						int idx = 1;
						while(uploadFile.exists()) {
							int lastDot = originName.lastIndexOf(".");
							String prof_name = originName.substring(0, lastDot);
							String prof_exe = originName.substring(lastDot+1);
							uploadFile = new File(profPath, prof_name+"_"+idx++ +"."+prof_exe);
						}
					
						try {
							houseImg.transferTo(uploadFile);
						}catch(Exception e) {
							System.out.println("사진 업로드 에러 발생");
							e.printStackTrace();
						}
						uploadPic = uploadFile.getName();
					}
				}
		
				
		
		int result = service.houseInsert(hVo);
		try {
			if(result>0) { //하우스 등록 성공
				mav.setViewName("redirect:houseIndex");
			}else {
				mav.setViewName("redirect:houseWrite1");
			}
		}catch(Exception e) {
			System.out.println("하우스 글 등록 에러 발생");
		}
		
		
		
		return mav;
	};
	
	
	//하우스 등록 수정
	@RequestMapping("/houseEdit")
	public String houseEdit() {
		return "house/houseEdit";
	}
}
