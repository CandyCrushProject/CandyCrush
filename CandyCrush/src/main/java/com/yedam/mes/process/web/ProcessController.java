package com.yedam.mes.process.web;


import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.mes.process.service.ProcService;
import com.yedam.mes.process.vo.OrderPlanVO;

@Controller
public class ProcessController {
	
	@Autowired
	ProcService procService;
	
	// 생산관리 -> 생산계획관리
	@GetMapping("ProcManagement")
	public String ProcessPlanManagement() {
		return "process/processManagement";
	}
	
	
	@GetMapping("getOrder")
	@ResponseBody
	public Map<String, Object> getOrderSheet() {
	    Map<String, Object> resultMap = new HashMap<>();
	    resultMap.put("result", procService.getOrder());
		System.out.println(resultMap);
		return resultMap;
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
