package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.LikeMarkVO;
import com.seoulmate.home.vo.MateWriteVO;

public interface MypageDAO {
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
