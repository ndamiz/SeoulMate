package com.seoulmate.home.dao;

import com.seoulmate.home.vo.ContactVO;

public interface QnaDAO {
	//신고 등록하기
	public int contactInsert(ContactVO cVO);
}
