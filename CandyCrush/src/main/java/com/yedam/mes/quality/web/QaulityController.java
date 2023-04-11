package com.yedam.mes.quality.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.mes.quality.service.QualityServcie;
import com.yedam.mes.quality.service.vo.QualityMtTestVO;

@Controller
public class QaulityController {
	@Autowired
	QualityServcie qualityService;
	@GetMapping("QualityMat")
	public String QualityMat(Model model) {
		model.addAttribute("OrderList",qualityService.getQualityOrderList());
		return "quality/QualityMtrlManagement";
	}
	
	@PostMapping("MtTestSearch")
	@ResponseBody
	public List<QualityMtTestVO> MtTestSerch(@RequestParam String moCd){
		return qualityService.selectMtQualityTestList(moCd);
	}
}
