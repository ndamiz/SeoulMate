package com.seoulmate.home.service;

import java.util.List;

import com.seoulmate.home.vo.ListVO;

public interface ListService {
	// 매칭된 하우스 목록 가져오기
	public List<ListVO> premiumHouseList(String userid);
	// 특정 하우스의 매칭 점수 가져오기
	public ListVO premiumHouseSocre(String userid, int pno);
}
