package com.seoulmate.home.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.AdminDAO;
import com.seoulmate.home.dao.MemberDAO;
import com.seoulmate.home.vo.HouseWriteVO;
import com.seoulmate.home.vo.MateWriteVO;
import com.seoulmate.home.vo.MemberVO;
import com.seoulmate.home.vo.PagingVO;
import com.seoulmate.home.vo.PayVO;
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
	public List<Map<String, Object>> houseDetailInfoSelect(HouseWriteVO hwVO) {
		return dao.houseDetailInfoSelect(hwVO);
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
	
// pay management ///////////////////////////////////
	@Override
	public int payTotalRecode(Map<String, Object> map) {
		return dao.payTotalRecode(map);
	}
	@Override
	public List<PayVO> payOnePageListSelect(Map<String, Object> map) {
		return dao.payOnePageListSelect(map);
	}
	
// sales management ///////////////////////////////////
	@Override
	public List<PayVO> salesOnePageListSelect(Map<String, Object> map) {
		return dao.salesOnePageListSelect(map);
	}
	@Override
	public PayVO salesTotalAmountSelect(PayVO payVO) {
		return dao.salesTotalAmountSelect(payVO);
	}

// report management ///////////////////////////////////	
	@Override
	public int reportInsert(ReportVO vo) {
		return dao.reportInsert(vo);
	}
	@Override
	public List<ReportVO> reportTotalRecord(PagingVO pVo) {
		return dao.reportTotalRecord(pVo);
	}
	@Override
	public ReportVO reportInfo(int num, String category) {
		return dao.reportInfo(num, category);
		
	}
	@Override
	public String[] reportCategorySelect(String keyword) {
		return dao.reportCategorySelect(keyword);
	}
	@Override
	public int allStateUdate(int no, String userid, String category, String state) {
		return dao.allStateUdate(no, userid, category, state);
	}
	@Override
	public int reportStateUpdate(int num, String state) {
		return dao.reportStateUpdate(num, state);
	}
	@Override
	public int checkReportCnt(String userid) {
		return dao.checkReportCnt(userid);
	}
	@Override
	public int addBlacklist(String userid) {
		return dao.addBlacklist(userid);
	}
	@Override
	public String getNumFromReport(int no) {
		return dao.getNumFromReport(no);
	}
	@Override
	public int reportRecordCnt(PagingVO pVO) {
		return dao.reportRecordCnt(pVO);
	}
}
