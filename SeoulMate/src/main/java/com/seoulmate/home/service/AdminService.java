package com.seoulmate.home.service;

import java.util.List;

import com.seoulmate.home.vo.PayVO;

public interface AdminService {
	// 회원 목록 출력
	public List<String> memberSelect();
	
	
//pay management /////////////////////////////////////////
	// 결제관리 페이지 총 레코드 수 확인 
	public int totalRecode(PayVO payVO);
	// 결제관리 페이지 리스트 가져오기 
	public List<PayVO> payOnePageListSelect(PayVO payVO);
}
