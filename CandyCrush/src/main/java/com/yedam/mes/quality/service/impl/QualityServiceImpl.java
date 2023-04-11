package com.yedam.mes.quality.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.quality.mapper.QualityMapper;
import com.yedam.mes.quality.service.QualityServcie;
import com.yedam.mes.quality.service.vo.QualityOrderVO;
@Service
public class QualityServiceImpl implements QualityServcie {
	@Autowired
	QualityMapper qualityMapper;
	
	@Override
	public List<QualityOrderVO> getQualityOrderList() {//주문목록조회
		return qualityMapper.getQualityOrderList();
	}

}
