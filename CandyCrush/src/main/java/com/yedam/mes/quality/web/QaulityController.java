package com.yedam.mes.quality.web;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.mes.process.vo.OrderPlanVO;
import com.yedam.mes.quality.service.QualityServcie;

@Controller
public class QaulityController {
	@Autowired
	QualityServcie qualityService;
	@GetMapping("QualityMat")
	public String QualityMat(Model model) {
		model.addAttribute("OrderList",qualityService.getQualityOrderList());
		return "quality/QualityMtrlManagement";
	}
}
