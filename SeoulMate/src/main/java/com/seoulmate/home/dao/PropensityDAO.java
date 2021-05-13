package com.seoulmate.home.dao;

import com.seoulmate.home.vo.PropensityVO;

public interface PropensityDAO {
	// 성향 추가
	public int propInsert(PropensityVO vo);
	// 메이트 성향이 있는지 가져옴
	public int propPcaseM(String userid);
	// 하우스 성향이 있는지 가져옴
	public int propPcaseH(String userid);
	// 메이트 성향 가져오기
	public PropensityVO propMateSelect(String userid);
	// 메이트 성향 수정
	public int propMateUpdate(PropensityVO pVO);
	// 하우스 성향 가져오기
	public PropensityVO propHouseSelect(String userid, int pno);
	// 하우스 성향 수정
	public int propHouseUpdate(PropensityVO pVO);
	// 집 등록을 하지않은 하우스 성향 갯수 가져오기
	public int propHcnt(String userid);
	// 집 등록을 하지않은 하우스의 번호 가져오기
	public int propNoHouse(String userid);
	// 집 등록을 하지않은 하우스의 성향 가져오기
	public int noHousePnoChk(String userid, int pno);
	// 집 등록을 하지않은 하우스의 성향 수정
	public int propNoHouseUpdate(PropensityVO pVO);
}
