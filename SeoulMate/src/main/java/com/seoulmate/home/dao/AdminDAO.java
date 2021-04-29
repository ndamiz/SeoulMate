package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.MemberVO;

public interface AdminDAO {
	// 회원 목록 출력
	public List<String> memberSelect();
	// 회원 정보 출력
	public MemberVO memberInfo(String userid);
}
