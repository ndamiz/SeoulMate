package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.CommunityReplyVO;

public interface CommunityReplyDAO {
	//댓글 목록 불러오기
	public List<CommunityReplyVO> replyList(int no);
	//댓글 등록하기
	public int replyInsert(CommunityReplyVO vo);

}
