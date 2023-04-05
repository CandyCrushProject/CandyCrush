package com.yedam.mes.material.mapper;

import java.util.List;

import com.yedam.mes.material.service.MaterialOrderVO;
import com.yedam.mes.material.service.MaterialVO;

public interface MaterialMapper {
	//자재 전체조회
	public List<MaterialVO> mtrlAllList();
	//자재발주 전체조회
	public List<MaterialOrderVO> mtrlOrderAllList();
}
