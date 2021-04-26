package com.seoulmate.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.seoulmate.home.dao.BoardDAO;
import com.seoulmate.home.vo.BoardVO;
@Service
public class BoardServiceImp implements BoardService {
	@Inject
	BoardDAO dao;
	
	@Override
	public List<BoardVO> comAllRecord() {
		return dao.comAllRecord();
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return dao.boardInsert(vo);
	}
	
}
