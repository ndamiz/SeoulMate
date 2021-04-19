package com.seoulmate.home.member;

public interface MemberDAOImp {
	// 아이디 중복 검사
	public int idCheck(String userid);
}
