package com.seoulmate.home.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PagingVO;
import com.seoulmate.home.vo.PayVO;
import com.seoulmate.home.vo.PropensityVO;
import com.seoulmate.home.vo.ReportVO;

public interface AdminDAO {
	// 회원 목록 출력
	public List<String> memberSelect(PagingVO pVO);
	// 회원 정보 출력
	public MemberVO memberInfo(String userid);
	// 회원 정보 수정
	public int memberInfoSave(MemberVO vo);
	// 회원 총 레코드
	public int membertotalRecord(PagingVO pVO);

//house Management ///////////////////////////////////////
	//하우스관리 페이지 총 레코드 수 확인 
	public int houseTotalRecode(Map<String, Object> map);
	// 하우스관리 페이지 리스트 가져오기 
	public List<HouseWriteVO> houseOnePageListSelect(Map<String, Object> map);
	// 하우스관리 - 개인정보 확인 
	public HouseWriteVO houseDetailInfoSelect(HouseWriteVO hwVO);
	// 하우스관리 - Hosuse propensity 확인 
	public PropensityVO propensitySelect(HouseWriteVO hwVO);
	// 하우스관리 - HouseRoom정보 확인 
	public List<HouseRoomVO> houseRoomInfoSelect(HouseWriteVO hwVO);
	//하우스관리 조건에맞는 총레코드 리스트
	public List<HouseWriteVO> houseListSelect(Map<String, Object> map);
//하우스, 메이트 관리 
	//propensity 확인 
	public PropensityVO propensitySelect(int pno);
//mate Management ///////////////////////////////////////	
	public int mateTotalRecode(Map<String, Object> map);
	//메이트관리 - 페이지 리스트 가져오기
	public List<MateWriteVO> mateOnePageListSelect(Map<String, Object> map);
	//메이트 관리 - 개인정보 셀렉트
	public MateWriteVO mateDetailInfoSelectMateWrite(MateWriteVO mwVO);
	//메이트관리 - memberVO 셀렉트 
	public MemberVO mateDetailInfoSelectMember(String userid);
	//메이트관리 조건에맞는 총레코드 리스트
	public List<MateWriteVO> mateListSelect(Map<String, Object> map);
//pay management /////////////////////////////////////////
	// 결제관리 페이지 총 레코드 수 확인 
	//public int payTotalRecode(PayVO payVO);
	public int payTotalRecode(Map<String, Object> map);
	// 결제관리 페이지 리스트 가져오기 
	public List<PayVO> payOnePageListSelect(Map<String, Object> map);
	//조건에맞는 총레코드 리스트
	public List<PayVO> payListSelect(Map<String, Object> map);
	
	
//sales management ///////////////////////////////////////
	//조건에 맞는 레코드리스트 구하기 (year, month, date)
	public List<PayVO> salesList(PayVO payVO);
	//유저 목록 가져오기.  
	public List<PayVO> salesUserList(String date);
//report management ///////////////////////////////////////
	// 신고 등록
	public int reportInsert(ReportVO vo);
	// 신고 목록 불러오기
	public List<ReportVO> reportTotalRecord();
	
}
