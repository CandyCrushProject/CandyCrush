package com.yedam.mes.quality.web;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "quality/QualityMtrlManagement";
	}
	
	@PostMapping("MtTestSearch")
	@ResponseBody
	public List<QualityMtTestVO> MtTestSerch(@RequestParam String modCd){
		return qualityService.selectMtQualityTestList(modCd);
	}
	@PostMapping("MtInspInsert")
	@ResponseBody
	public String InsertMtInsps(@Param("MtInspInsert") MtInspInsertVO inspvo,@Param("MtInspBadInsert")List<MtInspBadInsertVO>badvo) {
		qualityService.InsertMtInsps(inspvo,badvo);
		return "sucess";
	}
	

	
}
