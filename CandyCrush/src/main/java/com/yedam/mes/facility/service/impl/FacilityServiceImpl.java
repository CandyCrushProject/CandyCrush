package com.yedam.mes.facility.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.mes.facility.mapper.FacilityMapper;
import com.yedam.mes.facility.service.FacilityService;
import com.yedam.mes.facility.service.vo.FacilityDownVO;
import com.yedam.mes.facility.service.vo.FacilityMaintenanceVO;
import com.yedam.mes.facility.service.vo.FacilityOperationStatVO;
import com.yedam.mes.facility.service.vo.FacilityOperationVO;
import com.yedam.mes.facility.service.vo.FacilityStatVO;
@Service
public class FacilityServiceImpl implements FacilityService {
	@Autowired
	FacilityMapper facilityMapper;
	@Override
	public List<FacilityStatVO> selectFacilityStat() {
		// TODO Auto-generated method stub
		return facilityMapper.selectFacilityStat();
	}
	@Override
	public List<FacilityMaintenanceVO> selectFacilityMaintenance() {
		// TODO Auto-generated method stub
		return facilityMapper.selectFacilityMaintenance();
	}
	@Override
	public int insertFacilityMaintenance(FacilityMaintenanceVO mtnVO) {
		// TODO Auto-generated method stub
		return facilityMapper.insertFacilityMaintenance(mtnVO);
	}
	@Override
	public List<FacilityOperationVO> selectFacilityOperation() {
		// TODO Auto-generated method stub
		return facilityMapper.selectFacilityOperation();
	}
	@Override
	public List<FacilityDownVO> getFacilityDownCode() {
		// TODO Auto-generated method stub
		return facilityMapper.getFacilityDownCode();
	}
	@Override
	public List<FacilityOperationStatVO> facilityOperationStat() {
		// TODO Auto-generated method stub
		return facilityMapper.facilityOperationStat();
	}
	@Override
	public void insertFacilityAbortOpertation(FacilityOperationVO oprVO) {
		// TODO Auto-generated method stub
		facilityMapper.insertFacilityAbortOpertation(oprVO);
		facilityMapper.updateFacilityOpertationStat(oprVO);

	}
	@Override
	public void insertFacilityRestartOpertation(FacilityOperationVO oprVO) {
		facilityMapper.insertFacilityRestartOpertation(oprVO);
		facilityMapper.updateFacilityOpertationStat(oprVO);
		// TODO Auto-generated method stub
	}
}
