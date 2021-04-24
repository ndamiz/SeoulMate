package com.seoulmate.home.member;

public interface MemberDAOImp {
	// 아이디 중복 검사
	public int idCheck(String userid);
	// 회원정보 가져오기
	public MemberVO memberSelect(String userid);
	// 기존 비밀번호 가져오기
	public int memberPwdSelect(String userid, String userpwd);
	// 아이디 찾기
	public String memberFindId(MemberVO vo);
	// 회원 탈퇴
	public int memberExit(String userid, String userpwd);
}
