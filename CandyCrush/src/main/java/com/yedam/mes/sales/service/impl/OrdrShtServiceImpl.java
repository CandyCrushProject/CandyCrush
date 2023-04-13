package com.yedam.mes.sales.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.material.service.MaterialOrderVO;
import com.yedam.mes.sales.mapper.OrdrShtMapper;
import com.yedam.mes.sales.service.OrdrShtService;
import com.yedam.mes.sales.service.vo.OrdrShtVO;

@Service
public class OrdrShtServiceImpl implements OrdrShtService{

	@Autowired
	OrdrShtMapper mapper;

	// 주문서 전체조회
	@Override
	public List<OrdrShtVO> ordrShtAllList() {
		
		return mapper.ordrShtAllList();
	}

	// 주문서 검색조회
	@Override
	public List<OrdrShtVO> ordrShtSrchList(String caNm, String orshStrDt, String orshEndDt) {
		
		return mapper.ordrShtSrchList(caNm, orshStrDt, orshEndDt);
	}
	
	// 모달창 거래처 전체조회
	@Override
	public List<OrdrShtVO> accoutnAllList() {
		
		return mapper.accoutnAllList();
	}

	// 모달창 거래처 검색조회
	@Override
	public List<OrdrShtVO> accoutnSrchList(@Param("caNm") String caNm, @Param("caNo") String caNo) {
		
		return mapper.accoutnSrchList(caNm, caNo);
	}
	
	// 주문서관리페이지 거래처 검색하면 검색한 거래처에 해당하는 주문서 보여줌
	@Override
	public List<OrdrShtVO> ordrShtMngnSrch(String caNm) {
		
		return mapper.ordrShtMngnSrch(caNm);
	}

	// 주문서코드 자동생성
//	@Override
//	public List<OrdrShtVO> getOrdrShtCode() {
//		
//		return mapper.getOrdrShtCode();
//	}

	// 주문서디테일코드 자동생성
	@Override
	public String getOrdrShtDtlCode() {
		
		return mapper.getOrdrShtDtlCode();
	}

	// 주문서 등록 모달창 상품 리스트
	@Override
	public List<OrdrShtVO> getProdList() {
		
		return mapper.getProdList();
	}
	
	// 모달창 주문서헤더 + 주문서디테일 등록
	@Override
	public int insertOrdrSht(OrdrShtVO vo, List<OrdrShtVO> list) {
		int cnt = 0;
		
		String ordrShtCode = mapper.getOrdrShtCode();
		vo.setOrshNo(ordrShtCode);
		
		cnt = mapper.insertOrdrShtHdr(vo);
		
		for(OrdrShtVO ordrShtVO: list) {
			ordrShtVO.setOrshNo(ordrShtCode);
			cnt += mapper.insertOrdrShtDtl(ordrShtVO);
		}
		
		return cnt;
	}


	
	// 주문서 수정

	
	// 주문서 삭제


}
