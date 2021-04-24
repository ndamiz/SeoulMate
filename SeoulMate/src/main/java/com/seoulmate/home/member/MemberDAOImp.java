package com.seoulmate.home.member;


public interface MemberDAOImp {
	public MemberVO loginCheck(String userid, String username);
	
	// 아이디 찾기
    public String memberFindId(MemberVO vo);
}
