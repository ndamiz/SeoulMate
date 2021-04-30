package com.seoulmate.home.service;

import java.util.List;

import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PayVO;

public interface AdminService {
	// 회원 목록 출력
	public List<String> memberSelect();

	//회원 정보 출력
	public MemberVO memberInfo(String userid);
	
	
	
//pay management /////////////////////////////////////////
	// 결제관리 페이지 총 레코드 수 확인 
	public int totalRecode(PayVO payVO);

	public List<PayVO> payOnePageListSelect(PayVO payVO);

}
