package com.seoulmate.home.service;

import java.util.List;

import com.seoulmate.home.vo.MemberVO;

public interface AdminService {
	// 회원 목록 출력
	public List<String> memberSelect();
	// 회원 정보 출력
	public MemberVO memberInfo(String userid);
	// 회원 정보 수정
	public int memberInfoSave(MemberVO vo);
}
