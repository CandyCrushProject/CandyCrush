package com.yedam.mes.sales.web;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.mes.sales.service.OrdrShtService;
import com.yedam.mes.sales.service.vo.OrdrShtVO;

@Controller
public class OrdrShtController {

	@Autowired
	OrdrShtService service;
	
	//주문조회 페이지
	@GetMapping("ordrShtList")
	public String ordrShtAllList(Model model) {
		
		model.addAttribute("ordrShtList", service.ordrShtAllList());
		System.out.println(service.ordrShtAllList());
		
		return "sales/orderSheet";
	}
	
	// 조회검색 페이지
	@PostMapping("ordrShtSrch")
	@ResponseBody
	public List<OrdrShtVO> ordrShtSrchList(@RequestParam(required = false) String caNm, @RequestParam(required = false) String orshStrDt, @RequestParam(required = false) String orshEndDt) {
		return service.ordrShtSrchList(caNm, orshStrDt, orshEndDt);
	}
	
}
