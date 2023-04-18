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

import com.yedam.mes.quality.service.QualityServcie;
import com.yedam.mes.quality.service.vo.MtInspBadInsertVO;
import com.yedam.mes.quality.service.vo.ProdInsertTestVO;
import com.yedam.mes.quality.service.vo.ProdInspVO;
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
	
	//제품검사----------------------------------------------------------------------
	//제품검사관리 페이지
	@GetMapping("QualityProduct")
	public String QualityProduct(Model model) {
		model.addAttribute("procProdList",qualityService.procProdList());
		return "quality/QualityProdManagement";
	};
	
	@PostMapping("procProdAllList")
	@ResponseBody
	public List<ProdInspVO> prodIsEndDtNotNull(@RequestParam(required = false) String cprNm,
												@RequestParam(required = false) String start,
												@RequestParam(required = false) String end){
		return qualityService.procPrprEndIsNAllList(cprNm, start, end);
	};
	
	//생산지시를 기준으로 공정 상세를 가져온다
	@PostMapping("procPrprDetailList")
	@ResponseBody
	public List<ProdInspVO> procPrprDetailList(@RequestParam String prcmCd){
		return qualityService.procDetailList(prcmCd);
	};
	
	//제품검수 테이블로 INSERT
	@PostMapping("prodInspInsert")
	@ResponseBody
	public Boolean prodInspInsert(@RequestBody List<ProdInsertTestVO> vo) {
		Boolean response = true;

		int result = qualityService.prodInspInsert(vo);
		
		if(result != 0) {
			response = false;
		};
		
		return response;
	};
	
	//INSERT 후 공정지시 6번 상태변경(UPDATE)
	@PostMapping("prprEndUpdate")
	@ResponseBody
	public Boolean prprEndUpdate(@RequestBody ProdInsertTestVO vo) {
		Boolean resp = false;
		System.out.println(vo);
		
		int result = qualityService.procProgUpdate(vo);
		
		if(result != 0) {
			resp = true;
		}
		
		return	resp;
	}
	
	
	
	
	
	
	
}
