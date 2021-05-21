package com.seoulmate.home.service;

import java.util.List;

import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.PropensityVO;

public interface HouseService {
	
	//하우스 등록
	public int houseInsert(HouseWriteVO vo);
	
	//하우스(방) 등록
	public int roomInsert(HouseRoomVO vo);
	
	// 성향 추가
	public int propInsert(PropensityVO vo);
	
	// 성향 업데이트
	public int propHouseUpdate(PropensityVO vo);
	
	//하우스 등록했는지 확인 (0-> 성향pno 확인해야함)
	public int houseCheck(String userid);
	
	//성향 pno 확인
	public int housePnoCheck(String userid);
	
	//성향pno의 psq.currval 값 가져오기
	public int proPnoCheck(String userid);

	//가입할때 h 유형가입, pno 확인
	public int proHouseCheck(String userid);
	
	//house name 가져오기
//	public String housenameCheck(String housename);
	
	//house name 수정하기
	public int housenameUpdate(String housename, int pno);
	
	//pcase='h' 일 경우 성향 가져오기, 하우스 성향 가져오기
	public PropensityVO propHouseSelect(String userid, int pno);
	
	//housewrite 가져오기
	public HouseWriteVO houseSelect(int no, String userid);
	
	//houseroom 가져오기
	public HouseRoomVO roomSelect(int no, String userid);
	
	//하우스 업데이트
	public int houseUpdate(HouseWriteVO vo);
	
	//방 수정
	public int roomUpdate(HouseRoomVO vo);
	
	//하우스 삭제
	public int houseDel(int no, String userid);
	
	//방 삭제
	public int roomDel(int no, String userid);
	
	//하우스 사진 가져오기
	public String houseProfilePic(String housepic1, int no);
	
	//하우스 인덱스에서 New 하우스 리스트 9개 출력하기
	public List<HouseWriteVO> getNewIndexHouse(String addr);
	
	//하우스 보기(내가 쓴 글 아니여도 가능)
	public HouseWriteVO houseSelect2(int no);
	
	//houseRoom 가져오기 (본인 작성글 아니여도 가능)
	public HouseRoomVO roomSelect2(int no);
	
	// 하우스 성향 가져오기(본인 작성 글 아니여도 가능)
	public PropensityVO propHouseSelect2(int pno);
	
	// 회원 프로필 사진 가져오기
	public String memberProfile(String userid);
	
	// 하우스+룸 삭제 -> 하우스네임 null 로 변경
	public int ProHouseNameUpdate(PropensityVO vo);
	
	//사용자의 모든 성향 가져오기
	public List<PropensityVO> getPropInfo(String userid, String housename);
	

}
