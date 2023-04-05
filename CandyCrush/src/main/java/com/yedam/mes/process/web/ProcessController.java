package com.yedam.mes.process.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.yedam.mes.process.service.ProcService;

@Controller
public class ProcessController {
	
	@Autowired
	ProcService procService;
	
	// 생산관리 -> 생산계획관리
	@GetMapping("ProcManagement")
	public String ProcessPlanManagement(Model model) {
		model.addAttribute("orderInfo", procService.getOrder());
		System.out.println(procService.getOrder());
		return "process/processManagement";
	}
	
	// 생산관리 -> 생산지시관리
	@GetMapping("ProcOrder")
	public String ProcOrderManagement() {
		return "process/processOrder";
	}
	
	// 생산관리 -> 생산공정관리
	@GetMapping("ProdProcManagement")
	public String ProdProcManagement() {
		return "process/prodProcManage";
	}
}
