package com.seoulmate.home.service;

import com.seoulmate.home.vo.ContactVO;

public interface QnaService {
	//문의 등록하기
	public int contactInsert(ContactVO cVO);
	//비회원 아이디 체크
	public String useridCheck(String userid);
}
