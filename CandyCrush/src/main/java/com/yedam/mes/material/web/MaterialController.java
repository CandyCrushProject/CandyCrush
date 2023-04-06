package com.yedam.mes.material.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.mes.material.service.AccountVO;
import com.yedam.mes.material.service.MaterialService;
import com.yedam.mes.material.service.MaterialVO;

@Controller
public class MaterialController {
	@Autowired
	MaterialService service;
	
	//자재발주관리 페이지
	@GetMapping("mtrlOrder")
	public String mtrlOrder(Model model) {
		//model.addAttribute("moList", service.mtrlAllList());
		model.addAttribute("accountList", service.accountCheck());
		return "material/materialOrders";
	}
	
	//자재발주관리/자재검색기능
	@PostMapping("mtrlSearch")
	@ResponseBody
	public List<MaterialVO> mtrlSearch(@RequestParam(required = false) String caNm, @RequestParam(required = false)  String cmmNm){
		return service.mtrlSearch(caNm, cmmNm);
	}
	
	//자재발주관리/모달/업체검색
	@PostMapping("accountCheck")
	@ResponseBody
	public List<AccountVO> accountCheck(@RequestParam(required = false) String caNm, @RequestParam(required = false)  String cmmNm){
		return service.accountCheckModal(caNm, cmmNm);
	}
	
	//자재발주조회 페이지
	@GetMapping("mtrlOrderList")
	public String mtrlOrderList(Model model) {
		
		
		return "material/materialOrderList";
	}
	
	//자재입고검사조회 페이지
	@GetMapping("mtrlInspCheck")
	public String mtrlInsp(Model model) {
		//model.addAttribute("materialInsp", );
		return "material/mtrlInspCheck";
	}
	
	//자재입고검사관리(품질로빼버리기) 페이지
	@GetMapping("mtrlInspManagement")
	public String mtrlInspManagement(Model model) {
		return "material/mtrlInspManagement";
	}
	
	//자재입고관리 페이지
	@GetMapping("mtrlInputManagement")
	public String mtrlInputManagement(Model model) {
		return "material/mtrlInputManagement";
	}
	
	//자재출고관리 페이지
	@GetMapping("mtrlOutputManagement")
	public String mtrlOutputManagement(Model model) {
		return "material/mtrlOutputManagement";
	}
}
