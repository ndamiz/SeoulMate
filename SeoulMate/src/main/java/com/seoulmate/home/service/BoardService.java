package com.seoulmate.home.service;

import java.util.List;

import com.seoulmate.home.vo.BoardVO;
import com.seoulmate.home.vo.PageVO;

public interface BoardService {
	//커뮤니티 게시판 글 목록 불러오기
	public List<BoardVO> comAllRecord(PageVO pVo);
	//글 등록
	public int boardInsert(BoardVO vo);
	// 페이징에 쓰일 총 레코드 수 구하기
	public int totalRecord(PageVO vo);
	//글 내용보기
	public BoardVO boardSelect(int no);
	//댓글 수 확인
	public int replyCount(int no);
}
