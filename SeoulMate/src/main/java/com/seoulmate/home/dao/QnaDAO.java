package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.FaqVO;

public interface QnaDAO {
	// 자주하는 질문 목록 불러오기
	public List<FaqVO> faqAllRecord();
}
