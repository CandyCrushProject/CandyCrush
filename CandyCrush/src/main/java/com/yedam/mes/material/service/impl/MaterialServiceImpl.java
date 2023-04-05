package com.yedam.mes.material.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.material.mapper.MaterialMapper;
import com.yedam.mes.material.service.MaterialService;
import com.yedam.mes.material.service.MaterialVO;
import com.yedam.mes.material.service.MaterialOrderVO;

//구현클래스 : 빈을 등록되는 대상
@Service
public class MaterialServiceImpl implements MaterialService {
	@Autowired
	MaterialMapper mapper;

	@Override
	public List<MaterialVO> mtrlAllList() {
		return mapper.mtrlAllList();
	}
	
	@Override
	public List<MaterialOrderVO> mtrlOrderAllList() {
		return mapper.mtrlOrderAllList();
	}
}
