package com.seoulmate.home.dao;

import com.seoulmate.home.vo.PropensityVO;

public interface PropensityDAO {
	// 성향 추가
	public int propInsert(PropensityVO vo);
	// 하우스인지 메이트인지 선택
	public String propPcase(String userid);
	// 메이트 성향 가져오기
	public PropensityVO propMateSelect(String userid);
	// 메이트 성향 수정
	public int propMateUpdate(PropensityVO pVO);
}
