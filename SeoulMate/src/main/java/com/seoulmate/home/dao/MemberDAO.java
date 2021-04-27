package com.seoulmate.home.dao;

import com.seoulmate.home.vo.MemberVO;

public interface MemberDAO {
	// 로그인
	public MemberVO loginCheck(String userid, String username);
	// 아이디 중복 검사
	public int idCheck(String userid);
	// 회원 가입
	public int memberInsert(MemberVO vo);
	// 회원정보 가져오기
	public MemberVO memberSelect(String userid);
	// 기존 비밀번호 가져오기
	public int memberPwdSelect(String userid, String userpwd);
	// 회원정보 수정(비밀번호 포함)
	public int memberUpdatePwdY(MemberVO vo);
	// 회원정보 수정(비밀번호 미포함)
	public int memberUpdatePwdN(MemberVO vo);
	// 아이디 찾기
	public String memberFindId(MemberVO vo);
	// 회원 탈퇴
	public int memberExit(String userid, String userpwd);
}
