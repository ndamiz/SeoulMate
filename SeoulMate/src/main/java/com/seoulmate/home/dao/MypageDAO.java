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
	// 찜 삭제하기
	public int likemarkDelete(int no, String userid);
	//사용자가 찜한 번호 가져오기
	public String[] getLikedNumber(String userid);

	//글 번호, 카테고리 받아오기
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
	//카테고리가 하우스 일 경우
	public HouseWriteVO houseLikeSelect(int no);
	//카테고리가 메이트인 경우
	public MateWriteVO mateLikeSelect(int no);
}
