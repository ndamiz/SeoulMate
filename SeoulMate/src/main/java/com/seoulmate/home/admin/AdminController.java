package com.seoulmate.home.admin;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@Autowired
	SqlSession sqlSession;
	
	//admin에 들어오면 나오는 대시보드
	@RequestMapping("/admin")
	public String adminDashboard() {
		return "/admin/adminDashboard";
	}
	
	//신고관리
	@RequestMapping("/admin/reportManagement")
	public String adminReport() {
		return "/admin/reportManagement";
	}
	
	//하우스 관리
	@RequestMapping("/admin/houseManagement")
	public String houseManagement() {
		return "/admin/houseManagement";
	}
	
	//메이트 관리
	@RequestMapping("/admin/mateManagement")
	public String mateManagement() {
		return "/admin/mateManagement";
	}
	
	//회원 관리
	@RequestMapping("/admin/memberManagement")
	public String memberManagement() {
		return "/admin/memberManagement";
	}
	
	//문의 관리
	@RequestMapping("/admin/qnaManagement")
	public String qnaManagement() {
		return "/admin/qnaManagement";
	}
}