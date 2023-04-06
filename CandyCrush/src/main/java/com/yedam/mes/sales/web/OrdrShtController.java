package com.yedam.mes.sales.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.mes.sales.service.OrdrShtService;

@Controller
public class OrdrShtController {

	@Autowired
	OrdrShtService service;
	
	//주문조회 페이지
	@GetMapping("OrdrShtList")
	public String ordrShtAllList(Model model) {
		
		model.addAttribute("ordrShtList", service.ordrShtAllList());
		System.out.println(service.ordrShtAllList());
		
		return "sales/orderSheet";
	}
}
