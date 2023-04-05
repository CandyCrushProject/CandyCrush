package com.yedam.mes.material.service;

import java.util.List;

public interface MaterialService {
	//자재 전체조회
	public List<MaterialVO> mtrlAllList();
	//자재발주 전체조회
	public List<MaterialOrderVO> mtrlOrderAllList();
	
}
