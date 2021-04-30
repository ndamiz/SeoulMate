package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.BoardDAO;
import com.seoulmate.home.vo.BoardVO;
import com.seoulmate.home.vo.PageVO;
@Service
public class BoardServiceImp implements BoardService {
	@Inject
	BoardDAO dao;
	
	@Override
	public List<BoardVO> comAllRecord(PageVO pVo) {
		return dao.comAllRecord(pVo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}

	@Override
	public int totalRecord(PageVO vo) {
		return dao.totalRecord(vo);
	}

	@Override
	public BoardVO boardSelect(int no) {
		return dao.boardSelect(no);
	}
}
