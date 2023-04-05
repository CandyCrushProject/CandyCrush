package com.yedam.mes.material.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.yedam.mes.material.service.MaterialService;

@Controller
public class MaterialController {
	@Autowired
	MaterialService service;
	
	//자재발주 페이지
	@GetMapping("mtrlOrder")
	public String marlOrder(Model model) {
		model.addAttribute("material",service.mtrlAllList());
		model.addAttribute("materialOrder",service.mtrlOrderAllList());
	
		return "material/materialOrders";
	}
	
	//
}
