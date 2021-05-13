package com.seoulmate.home.service;

import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.PropensityVO;

public interface MateService {

	//메이트 등록
	public int mateInsert(MateWriteVO vo);
	
	//성향 수정
	public int propMateUpdate(PropensityVO vo);
	
	//메이트 성향 no 가져오기
	public PropensityVO mateSelect(String userid);
	
	//메이트 수정
	public int mateUpdate(MateWriteVO vo);
}
