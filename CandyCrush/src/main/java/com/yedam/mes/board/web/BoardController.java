package com.yedam.mes.board.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.yedam.mes.board.service.BoardService;
import com.yedam.mes.board.service.BoardVO;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@GetMapping("main")
	public String main() {
		return "home/top";
	}
	// 전체조회
	@GetMapping("getBoardList")
	public String getBoardList(Model model) {
		model.addAttribute("boardList",boardService.getBoardList());
		return "board/boardList";
	}
	
	// 단건조회
	@GetMapping("getBoardInfo")
	public String getBoardInfo(BoardVO boardVO, Model model) {
		model.addAttribute("boardInfo", boardService.getBoard(boardVO));
		return "board/boardInfo";
	}
	
	// 등록 - 페이지
	@GetMapping("boardInsert")
	public String boardInsertForm(Model model) {
		model.addAttribute("bno",boardService.getBoardNo().getBno());
		return "board/boardInsert";
	}
	
	// 등록 - 처리
	@PostMapping("boardInsert") 
	public String boardInsertProcess(BoardVO boardVO) {
		
		boardService.insertBoard(boardVO);
		
		return "redirect:getBoardList"; 
	}
	
	// 수정 - 페이지
	@GetMapping("boardUpdate")
	public String boardUpdateForm(BoardVO boardVO, Model model) {
		model.addAttribute("boardInfo", boardService.getBoard(boardVO));
		return "board/boardUpdate";
	}

	// 수정 - 처리
	@PostMapping("boardUpdate")
	public String boardUpdateProcess(BoardVO boardVO) {
		
		boardService.updateBoard(boardVO);
		
		return "redirect:getBoardInfo?bno="+boardVO.getBno(); 
	}
	
	// 삭제
	@GetMapping("boardDelete")
	public String boardDelete(@RequestParam int bno){
		
		boardService.deleteBoard(bno);
		
		return "redirect:getBoardList"; 
	}
	
	
}
