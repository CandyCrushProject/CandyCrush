package com.yedam.mes.sales.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.mes.sales.service.OrdrShtService;
import com.yedam.mes.sales.service.vo.OrdrShtVO;

@Controller
public class OrdrShtController {

	@Autowired
	OrdrShtService service;
	
	// 거래처 검색조회
	@PostMapping("ordrAccntSrch")
	@ResponseBody
	public List<OrdrShtVO> accoutnSrchList(@RequestParam(required = false) String caNm, @RequestParam(required = false)  String caNo) {
		
		System.out.println("caNm" + caNm + ", caNo" + caNo);
		return service.accoutnSrchList(caNm, caNo);
	}
	
	// 주문서관리 페이지 띄워주는거
	@GetMapping("ordrMngntPage")
	public String ordrMngntPage(Model model) {
		
		return "sales/ordrShtMngmnt";
	}
	
	// 주문서관리페이지 주문서 리스트 조회
	@PostMapping("ordrMngntOrdrShtList")
	@ResponseBody
	public List<OrdrShtVO> ordrShtAllList() {
		
		return service.ordrShtAllList();
	}
	
	// 주문서관리페이지 거래처 리스트 조회
	@PostMapping("ordrMngntAccntList")
	@ResponseBody
	public List<OrdrShtVO> ordrMngntAccntList() {
		
		return service.accoutnAllList();
	}
	
	// 주문서관리페이지 거래처 검색조회
	@PostMapping("ordrMngntAccntSrch")
	@ResponseBody
	public List<OrdrShtVO> ordrMngntAccntSrch(@RequestParam(required = false) String caNm, @RequestParam(required = false)  String caNo) {
		
		System.out.println("caNm" + caNm + ", caNo" + caNo);
		return service.accoutnSrchList(caNm, caNo);
	}
	
	// 주문서관리페이지 거래처 검색하면 검색한 거래처에 해당하는 주문서 보여줌
	@PostMapping("ordrShtMngnSrch")
	@ResponseBody
	public List<OrdrShtVO> ordrShtMngnSrch(@RequestParam(required = false) String caNm) {
		
		System.out.println("caNm" + caNm);
		return service.ordrShtMngnSrch(caNm);
	}
	
	// 더블클릭했을때 모달창에 미리 보여줄 주문서 번호
//	@GetMapping("getOrdrShtCode")
//	@ResponseBody
//	public List<OrdrShtVO> getOrdrShtCode() {
//		
//		return service.getOrdrShtCode();
//	}
	
	// 제품을 추가할 때 모달창에 미리 보여줄 주문서디테일 번호
	@GetMapping("getOrdrShtDtlCode")
	@ResponseBody
	public OrdrShtVO getOrdrShtDtlCode() {
		OrdrShtVO vo = new OrdrShtVO();
		vo.setOrdrDtlCd(service.getOrdrShtDtlCode());
		return vo;
	}
	
	// 조회검색 페이지
	@GetMapping("getProdList")
	@ResponseBody
	public List<OrdrShtVO> getProdList() {
		//System.out.println("상품리스트 : " + service.getProdList());
		return service.getProdList();
	}
	
	//주문서관리 헤더와 디테일에 데이터 등록
//	@PostMapping("ordrShtForm")
//	@ResponseBody
//	public Boolean ordrShtInsertProcess(@RequestBody List<OrdrShtVO> vo){
//		
//		//vo 인스턴스 선언
//		OrdrShtVO newVo = new OrdrShtVO();
//		newVo.setCprCd(vo.get(0).getCprCd());	// CprCd 값을 가져와서 db에 전달
//		newVo.setCprNm(vo.get(0).getCprNm());	// CprNm 값을 가져와서 db에 전달
//		newVo.setOrdrDtlCnt(vo.get(0).getOrdrDtlCnt());	// OrdrDtlCnt 값을 가져와서 db에 전달
//		System.out.println(newVo.getCprCd() + ", " + newVo.getCprNm() + ", " + newVo.getOrdrDtlCnt());
//		
//		Boolean response = true;
//		int result = service.insertOrdrSht(newVo, vo); 	//발주관리헤더, 발주관리디테일
//		if(result < 1) {
//			response = false;
//		};
//		
//		return response;
//	};
	
	@PostMapping("ordrShtForm")
	@ResponseBody
	public Map<String, Object> ordrShtInsertProcess(@RequestBody Map<String, Object> map){
	
		System.out.println(map.get("data"));
		System.out.println(map.get("dataHd"));
		
		return map;
	}
//	public Boolean ordrShtInsertProcess(@RequestBody List<OrdrShtVO> vo){
//		
//		//vo 인스턴스 선언
//		OrdrShtVO newVo = new OrdrShtVO();
//		
//		// newVo.setCaNo(vo.get(0).getCaNo());
//		// newVo.setOrshDt(vo.get(0).getOrshDt());
//		// newVo.setDlvryDt(vo.get(0).getDlvryDt());
//		newVo.setCprCd(vo.get(0).getCprCd());	// CprCd 값을 가져와서 db에 전달
//		newVo.setCprNm(vo.get(0).getCprNm());	// CprNm 값을 가져와서 db에 전달
//		newVo.setOrdrDtlCnt(vo.get(0).getOrdrDtlCnt());	// OrdrDtlCnt 값을 가져와서 db에 전달
//		System.out.println(newVo.getCprCd() + ", " + newVo.getCprNm() + ", " + newVo.getOrdrDtlCnt());
//		
//		Boolean response = true;
//		int result = service.insertOrdrSht(newVo, vo); 	//발주관리헤더, 발주관리디테일
//		if(result < 1) {
//			response = false;
//		};
//		
//		return response;
//	};
}