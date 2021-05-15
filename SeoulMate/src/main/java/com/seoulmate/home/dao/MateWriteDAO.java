package com.seoulmate.home.dao;

import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.PropensityVO;

public interface MateWriteDAO {

	//메이트 등록
	public int mateInsert(MateWriteVO vo);
	
	//메이트 성향 no 가져오기
//	public PropensityVO mateSelect(String userid);
	
	//메이트 수정
	public int mateUpdate(MateWriteVO vo);
	
	//메이트 테이블 no 가져오기
	public int mateSelect(String userid);
}
