package com.yedam.mes.sales.mapper;

import java.util.List;

import com.yedam.mes.sales.service.vo.OrdrShtVO;

public interface OrdrShtMapper {
	
	// 전체조회
	public List<OrdrShtVO> ordrShtAllList();

	// 검색조회
	public List<OrdrShtVO> ordrShtSrchList();
}
