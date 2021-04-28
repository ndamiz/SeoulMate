package com.seoulmate.home.service;

import java.util.List;

import com.seoulmate.home.vo.BoardVO;

public interface BoardService {
	//커뮤니티 게시판 글 목록 불러오기
	public List<BoardVO> comAllRecord(String category);
	//글 등록
	public int boardInsert(BoardVO vo);
	
}
