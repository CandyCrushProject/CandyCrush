package com.yedam.mes.sales.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.sales.service.vo.OrdrShtVO;

public interface OrdrShtService {
	
	// 전체조회
	public List<OrdrShtVO> ordrShtAllList();
	
	// 검색조회
	public List<OrdrShtVO> ordrShtSrchList(@Param("caNm") String caNm,
										   @Param("orshStrDt") String orshStrDt,
										   @Param("orshEndDt") String orshEndDt);
	
}
