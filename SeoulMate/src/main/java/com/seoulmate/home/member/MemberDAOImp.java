package com.seoulmate.home.member;

public interface MemberDAOImp {
	// 아이디 중복 검사
	public int idCheck(String userid);
	// 회원정보 가져오기
	public MemberVO memberSelect(String userid);
}
