package com.seoulmate.home.service;

import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.PropensityVO;

public interface MateService {

	//메이트 등록
	public int mateInsert(MateWriteVO vo);
	
	//성향 수정
	public int propMateUpdate(PropensityVO vo);
	
	//메이트 성향 no 가져오기
//	public PropensityVO mateSelect(String userid);
	
	//메이트 수정
	public int mateUpdate(MateWriteVO vo);
	
	//메이트 테이블 no 가져오기
//	public int mateSelect(String userid);
	
	//matewrite 가져오기
	public MateWriteVO mateSelect(String userid);
	
	//메이트 삭제
	public int mateDel(int no, String userid);
	
	//메이트 사진 가져오기
	public String MateProfilePic(String matePic1, int no);
	
	//matewrite 가져오기 (본인 작성글 아니여도)
	public MateWriteVO mateSelect2(int no);
	
	// 메이트 성향 가져오기(본인 작성 글 아니여도 가능)
	public PropensityVO propMateSelect2(int pno);
}
