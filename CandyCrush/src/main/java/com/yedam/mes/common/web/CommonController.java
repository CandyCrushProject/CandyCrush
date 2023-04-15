package com.yedam.mes.common.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.mes.common.service.CommonService;

@Controller
public class CommonController {
	@Autowired
	CommonService service;
	
	@GetMapping("bomCheck")
	public String bomCheck() {
		return "common/bomCheck";
	}
}
