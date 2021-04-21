package com.seoulmate.home.board;

import java.util.List;

public interface BoardDAOImp {
	//커뮤니티 게시판 글 목록 불러오기
	public List<BoardVO> comAllRecord();
	//글 등록
	public int boardInsert(BoardVO vo);

}
