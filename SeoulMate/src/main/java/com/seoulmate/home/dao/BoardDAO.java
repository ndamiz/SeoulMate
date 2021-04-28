package com.seoulmate.home.dao;

import java.util.List;

import com.seoulmate.home.vo.BoardVO;

public interface BoardDAO {
	//커뮤니티 게시판 글 목록 불러오기
	public List<BoardVO> comAllRecord(String category);
	//글 등록
	public int boardInsert(BoardVO vo);
	
	public List<BoardVO> comAllRecord2();
}
