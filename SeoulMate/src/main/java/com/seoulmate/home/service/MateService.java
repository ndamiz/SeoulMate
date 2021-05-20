package com.seoulmate.home.service;


import java.util.List;

import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.PropensityVO;

public interface MateService {

	//메이트 등록
	public int mateInsert(MateWriteVO vo);
	
	//성향 수정
	public int propMateUpdate(PropensityVO vo);
	
	//메이트 성향 no 가져오기
//	public PropensityVO mateSelect(String userid);
	
	//메이트 수정
	public int mateUpdate(MateWriteVO vo);
	
	//메이트 테이블 no 가져오기
//	public int mateSelect(String userid);
	
	//matewrite 가져오기
	public MateWriteVO mateSelect(String userid);
	
	//메이트 삭제
	public int mateDel(int no, String userid);
	
	// 메이트 index에서 9개의 메이트 목록 가져오기
	public List<MateWriteVO> getNewIndexMate(String area, int rent, int deposit, int gender);
}
