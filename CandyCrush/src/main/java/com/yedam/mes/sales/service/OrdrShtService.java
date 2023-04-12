package com.yedam.mes.sales.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.yedam.mes.sales.service.vo.OrdrShtVO;

public interface OrdrShtService {
	
	// 주문서조회 페이지
	// 주문서 전체조회
	public List<OrdrShtVO> ordrShtAllList();
	
	// 주문서 검색조회
	public List<OrdrShtVO> ordrShtSrchList(@Param("caNm") String caNm,
										   @Param("orshStrDt") String orshStrDt,
										   @Param("orshEndDt") String orshEndDt);
	// 모달창 업체 전체조회
	public List<OrdrShtVO> accoutnAllList();
	
	// 모달창 업체 검색조회
	public List<OrdrShtVO> accoutnSrchList(@Param("caNm") String caNm, @Param("caNo") String caNo);
	
	// 주문서관리 페이지
	// 주문서코드 자동생성
	public List<OrdrShtVO> getOrdrShtCode();
	
	// 주문서디테일코드 자동생성
	public String getOrdrShtDtlCode();
	
	// 주문서 등록 모달창 상품 리스트
	public List<OrdrShtVO> getProdList();
	
}
