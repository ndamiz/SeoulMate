package com.seoulmate.home.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.AdminDAO;
import com.seoulmate.home.dao.MemberDAO;
import com.seoulmate.home.vo.HouseRoomVO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PagingVO;
import com.seoulmate.home.vo.PayVO;
import com.seoulmate.home.vo.PropensityVO;
import com.seoulmate.home.vo.ReportVO;

@Service
public class AdminServiceImp implements AdminService {
	@Inject
	AdminDAO dao;
	@Inject
	MemberDAO mDAO;
	
	@Override
	public List<String> memberSelect(PagingVO pVO) {
		return dao.memberSelect(pVO);
	}
	@Override
	public MemberVO memberInfo(String userid) {
		return dao.memberInfo(userid);
	}
	@Override
	public int memberInfoSave(MemberVO vo) {
		return dao.memberInfoSave(vo);
	}
	@Override
	public String memberProfile(String userid) {
		return mDAO.memberProfile(userid);
	}
	@Override
	public int membertotalRecord(PagingVO pVO) {
		return dao.membertotalRecord(pVO);
	}
	// house management ///////////////////////////////////
	@Override
	public int houseTotalRecode(Map<String, Object> map) {
		return dao.houseTotalRecode(map);
	}	
	@Override
	public List<HouseWriteVO> houseOnePageListSelect(Map<String, Object> map) {
		return dao.houseOnePageListSelect(map);
	}
	@Override
	public HouseWriteVO houseDetailInfoSelect(HouseWriteVO hwVO) {
		return dao.houseDetailInfoSelect(hwVO);
	}
	@Override
	public PropensityVO propensitySelect(int pno) {
		return dao.propensitySelect(pno);
	}
	@Override
	public List<HouseRoomVO> houseRoomInfoSelect(HouseWriteVO hwVO) {
		return dao.houseRoomInfoSelect(hwVO);
	}
	@Override
	public List<HouseWriteVO> houseListSelect(Map<String, Object> map) {
		return dao.houseListSelect(map);
	}
// mate management /////////////////////////////////////
	@Override
	public int mateTotalRecode(Map<String, Object> map) {
		return dao.mateTotalRecode(map);
	}
	@Override
	public List<MateWriteVO> mateOnePageListSelect(Map<String, Object> map) {
		return dao.mateOnePageListSelect(map);
	}
	@Override
	public MateWriteVO mateDetailInfoSelectMateWrite(MateWriteVO mwVO) {
		return dao.mateDetailInfoSelectMateWrite(mwVO);
	}
	@Override
	public MemberVO mateDetailInfoSelectMember(String userid) {
		return dao.mateDetailInfoSelectMember(userid);
	}
	@Override
	public List<MateWriteVO> mateListSelect(Map<String, Object> map) {
		return dao.mateListSelect(map);
	}
// pay management ///////////////////////////////////
	@Override
	public int payTotalRecode(Map<String, Object> map) {
		return dao.payTotalRecode(map);
	}
	@Override
	public List<PayVO> payOnePageListSelect(Map<String, Object> map) {
		return dao.payOnePageListSelect(map);
	}
	@Override
	public List<PayVO> payListSelect(Map<String, Object> map) {
		return dao.payListSelect(map);
	}
// sales management ///////////////////////////////////
	@Override
	public List<PayVO> salesList(PayVO payVO) {
		return dao.salesList(payVO);
	}
	@Override
	public List<PayVO> salesUserList(String date) {
		return dao.salesUserList(date);
	}
// report management ///////////////////////////////////	
	@Override
	public int reportInsert(ReportVO vo) {
		return dao.reportInsert(vo);
	}
	@Override
	public List<ReportVO> reportTotalRecord() {
		return dao.reportTotalRecord();
	}
	


}
