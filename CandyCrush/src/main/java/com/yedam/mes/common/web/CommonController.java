package com.yedam.mes.common.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.mes.common.service.CommonService;
import com.yedam.mes.common.service.vo.BomVO;

@Controller
public class CommonController {
	@Autowired
	CommonService service;
	
	@GetMapping("bomCheck")
	public String bomCheck(Model model) {
		return "common/bomCheck";
	};
	
	@PostMapping("bomProdSearch")
	@ResponseBody
	public List<BomVO> prodSearch(@RequestParam(required = false) String cprCd, @RequestParam(required = false) String cprNm){
		return service.prodAllList(cprCd, cprNm);
	};
	
	@PostMapping("bomListSearch")
	@ResponseBody
	public List<BomVO> bomListSearch(@RequestParam(required = false) String cprNm){
		return service.prodBomList(cprNm);
	}
	
	@PostMapping("bomDetailList")
	@ResponseBody
	public List<BomVO> bomDetailList(@RequestParam(required = false) String cprNm){
		return service.prodBomDetailList(cprNm);
	}
}
