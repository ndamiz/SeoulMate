package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.LikeMarkVO;
import com.seoulmate.home.vo.MateWriteVO;

public interface MypageDAO {
	// 찜 목록/////////////////////////////////////////////
	// 찜 등록하기
	public int likemarkInsert(int no, String userid, String category);
	//글 번호, 카테고리 받아오기
	public List<LikeMarkVO> likemarkAllRecord(String category, String userid);
	//하우스 글 정보 불러오기
	public HouseWriteVO getHousedetails(int no);
	//하우스 min rent, min deposit 가져오기
	public HouseRoomVO getMinRentDeposit(int no);
	//메이트 글 정보 불러오기
	public MateWriteVO getMatedetails(int no);
}
