package com.yedam.mes.sales.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.mes.sales.service.OrdrShtService;
import com.yedam.mes.sales.service.vo.OrdrAccntVO;
import com.yedam.mes.sales.service.vo.OrdrShtVO;

@Controller
public class OrdrShtController {

	@Autowired
	OrdrShtService service;
	
	//주문조회 페이지
	@GetMapping("ordrShtList")
	public String ordrShtAllList(Model model) {
		model.addAttribute("ordrShtList", service.ordrShtAllList()); // 주문서 목록
		model.addAttribute("accuntList", service.accoutnAllList()); // 거래처 목록
		return "sales/orderSheet";
	}
	
	// 조회검색 페이지
	@PostMapping("ordrShtSrch")
	@ResponseBody
	public List<OrdrShtVO> ordrShtSrchList(@RequestParam(required = false) String caNm, @RequestParam(required = false) String orshStrDt, @RequestParam(required = false) String orshEndDt) {
		//System.out.println("caNm:" + caNm + ", orshStrDt : " + orshStrDt + ", orshEndDt : " + orshEndDt);
		return service.ordrShtSrchList(caNm, orshStrDt, orshEndDt);
	}
	
	// 모달창 거래처 검색조회
	@PostMapping("ordrAccntSrch")
	@ResponseBody
	public List<OrdrShtVO> accoutnSrchList(@RequestParam(required = false) String caNm, @RequestParam(required = false)  String caNo) {
		
		System.out.println("caNm" + caNm + ", caNo" + caNo);
		return service.accoutnSrchList(caNm, caNo);
	}
	
	// 주문서관리 거래처 조회
	@GetMapping("ordrMngntPage")
	public String ordrMngntPage(Model model) {
		
		return "sales/ordrShtMngmnt";
		
	}
	
	@PostMapping("ordrMngntAccntList")
	@ResponseBody
	public List<OrdrShtVO> ordrMngntAccntList() {
		
		return service.accoutnAllList();
		
	}
	
	// 주문서관리에서 거래처 검색조회
	@PostMapping("ordrMngntAccntSrch")
	@ResponseBody
	public List<OrdrShtVO> ordrMngntAccntSrch(@RequestParam(required = false) String caNm, @RequestParam(required = false)  String caNo) {
		
		System.out.println("caNm" + caNm + ", caNo" + caNo);
		return service.accoutnSrchList(caNm, caNo);
	}
	
}