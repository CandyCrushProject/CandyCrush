package com.yedam.mes.sales.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.sales.mapper.OrdrShtMapper;
import com.yedam.mes.sales.service.OrdrShtService;
import com.yedam.mes.sales.service.vo.OrdrShtVO;

@Service
public class OrdrShtServiceImpl implements OrdrShtService{

	@Autowired
	OrdrShtMapper mapper;

	// 전체조회
	@Override
	public List<OrdrShtVO> ordrShtAllList() {
		
		return mapper.ordrShtAllList();
	}
	
	// 검색조회
	@Override
	public List<OrdrShtVO> ordrShtSrchList() {
		
		return mapper.ordrShtSrchList();
	}
	
	// 주문서 등록
	
	
	// 주문서 수정

	
	// 주문서 삭제
	
	

}
