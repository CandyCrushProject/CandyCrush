package com.yedam.mes.facility.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.facility.mapper.FacilityMapper;
import com.yedam.mes.facility.service.FacilityService;
import com.yedam.mes.facility.service.FacilityStatVO;
@Service
public class FacilityServiceImpl implements FacilityService {
	@Autowired
	FacilityMapper facilityMapper;
	@Override
	public List<FacilityStatVO> selectFacilityStat() {
		// TODO Auto-generated method stub
		return facilityMapper.selectFacilityStat();
	}

}