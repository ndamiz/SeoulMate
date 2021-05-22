package com.seoulmate.home.service;

import java.util.List;

import com.seoulmate.home.vo.ApplyInviteVO;
import com.seoulmate.home.vo.ChatRoomVO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.LikeMarkVO;
import com.seoulmate.home.vo.MateWriteVO;

public interface MypageService {
	// 찜 등록하기
	public int likemarkInsert(int no, String userid, String category);
	// 찜 삭제하기
	public int likemarkDelete(int no, String userid);
	//사용자가 찜한 번호 가져오기
	public String[] getLikedNumber(String userid);
	//로그인한 사용자 하우스 글 번호 받아오기
	public String[] getUsersHouseWriteNum(String userid);
	//로그인한 사용자 메이트 글 번호 받아오기
	public String[] getUsersMateWriteNum(String userid);

	//목록 불러오기
	public List<LikeMarkVO> likemarkAllRecord(String category, String userid);
	//하우스 글 정보 불러오기
	public HouseWriteVO getHousedetails(int no);
	//하우스 min rent, min deposit 가져오기
	public HouseRoomVO getMinRentDeposit(int no);
	//메이트 글 정보 불러오기
	public MateWriteVO getMatedetails(int no);
	

	//하우스 글 등록되어있는게 있는지 확인
	public int houseConfirm(String userid);
	//하우스 글 vo 받아오기. (list로 받는다)
	public List<HouseWriteVO> myPageHouseWriteSelect(String userid);
	//메이트 글 등록되어있는게 있는지 확인
	public int mateConfirm(String userid);	
	//메이트 글 vo 받아오기. 어짜피 1개임. vo로 받는다.  
	public MateWriteVO myPageMateWriteSelect(String userid);	
	
	//찜목록 있는지 확인. 
	public int likeMarkConfirm(String userid);
	//찜목록 목록 가져오기. (lno, no, category)
	public List<LikeMarkVO> likeMarkSelect(String userid);
	//pno확인
	public int pno_Select(int no);
	//카테고리가 하우스 일 경우
	public HouseWriteVO houseLikeSelect(LikeMarkVO lmVO);
	//카테고리가 메이트인 경우
	public MateWriteVO mateLikeSelect(LikeMarkVO lmVO);
	//팝업 
	// 메이트확인. 받은초대, 보낸신청
	// 하우스확인. 받은신청, 보낸초대
	public List<ApplyInviteVO> applyInviteSelect(ApplyInviteVO aiVO);
	// 메이트 글 vo받아오는거는 myPageMateWriteSelect사용하여 받기, 
	// 하우스 글 vo받아오기 
	public HouseWriteVO oneHouseWriteSelect(int no);
	//보낸신청, 보낸초대 삭제. 
	public int mypageApplyInviteCancel(ApplyInviteVO aiVO);
	//받은신청, 받은초대 - 승인
	public int applyInviteApproveUpdate(ApplyInviteVO aiVO);
	//초대하기, 신청하기
	public int applyInviteInsert(ApplyInviteVO aiVO);
	// 승인 후 housename, userid 가져오기. 
	public HouseWriteVO chatHouseSelect(int no); 
	// housename list 
	public List<HouseWriteVO> houseListSelect(String userid, String selectMate);
	public int housenameSelect(String housename);
	// 채팅 DB 데이터 확인. 
	public ChatRoomVO chatCheck(String chatuser1, String chatuser2);
	// 승인 후 채팅 insert 
	public int chatInsert(String name, String chatuser1, String chatuser2);
	// 채팅 name update
	public int chatUpdate(ChatRoomVO crVO);
	//하우스명이 채팅방 네임에 있는지 확인.
	public int chatCheckName(String name, String chatuser1, String chatuser2);
	//하우스인지, 메이트인지 확인. 
	public int noConfirmHouseOrMate(int no, String msg);
	//pno확인
	public int pnoConfirm(String userid, String pcase);
	//매칭완료로 변경
	public int stateCompleteUpdate(String tableName, String stateName, String no, String userid);
}
