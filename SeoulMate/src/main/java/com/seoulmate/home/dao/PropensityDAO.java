package com.seoulmate.home.dao;

import com.seoulmate.home.vo.PropensityVO;

public interface PropensityDAO {
	// 성향 추가
	public int propInsert(PropensityVO vo);
	// 하우스인지 메이트인지 선택
	public String propPcase(String userid);
}
