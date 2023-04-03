package com.yedam.mes.board.service;

import java.util.List;

public interface BoardService {

	// 전체조회
	public List<BoardVO> getBoardList();
	
	// 단건조회
	public BoardVO getBoard(BoardVO boardVO);
	
	// 등록하고자 하는 글번호
	public BoardVO getBoardNo();
	
	// 등록 - 등록된 글번호 반환
	public int insertBoard(BoardVO boardVO);
	
	// 수정 - 수정된 글번호 반환
	public int updateBoard(BoardVO boardVO);
	
	// 삭제 - 삭제된 글번호 반환
	public int deleteBoard(int bno);
}
