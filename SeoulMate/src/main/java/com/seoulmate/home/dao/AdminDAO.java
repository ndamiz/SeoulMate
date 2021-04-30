package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PayVO;

public interface AdminDAO {
	// 회원 목록 출력
	public List<String> memberSelect();
	
	// 회원 정보 출력
	public MemberVO memberInfo(String userid);

	
//pay management //////////////////////////////////////
	// 결제관리 페이지 총 레코드 수 확인 
	public int totalRecode(PayVO vo);
	// 결제관리 페이지 리스트 가져오기 
	public List<PayVO> payAllListSelect();
}
