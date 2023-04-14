package com.yedam.mes.quality.web;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.yedam.mes.quality.service.QualityServcie;
import com.yedam.mes.quality.service.vo.MtInspBadInsertVO;
import com.yedam.mes.quality.service.vo.MtInspInsertVO;
import com.yedam.mes.quality.service.vo.QualityMtTestVO;

@Controller
public class QaulityController {
	@Autowired
	QualityServcie qualityService;
	@GetMapping("QualityMat")
	public String QualityMat(Model model) {
		model.addAttribute("OrderList",qualityService.selectMtOrderInspStat());
		model.addAttribute("BadList",qualityService.selectMtBadCode());
		model.addAttribute("NewMiCd",qualityService.getNewMiCd());
		return "quality/QualityMtrlManagement";
	}
	
	@PostMapping("MtTestSearch")
	@ResponseBody
	public List<QualityMtTestVO> MtTestSerch(@RequestParam String modCd){
		return qualityService.selectMtQualityTestList(modCd);
	}
	@PostMapping("MtInspInsert")
	@ResponseBody
	public int InsertMtInsps(@RequestBody HashMap<String, Object> map) {
		return qualityService.InsertMtInsps(map);
	}
	@PostMapping("MtInspBadInsert")
	@ResponseBody
	public int InsertMtBadInsp(@RequestBody List<MtInspBadInsertVO> badvo) {
		return qualityService.InsertMtBadInsp(badvo);

	}
	

	
}
