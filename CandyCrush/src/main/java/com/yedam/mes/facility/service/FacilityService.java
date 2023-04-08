package com.yedam.mes.facility.service;

import java.util.List;

import com.yedam.mes.facility.service.vo.FacilityDownVO;
import com.yedam.mes.facility.service.vo.FacilityMaintenanceVO;
import com.yedam.mes.facility.service.vo.FacilityOperationStatVO;
import com.yedam.mes.facility.service.vo.FacilityOperationVO;
import com.yedam.mes.facility.service.vo.FacilityStatVO;

public interface FacilityService {
	public List<FacilityStatVO> selectFacilityStat();
	public List<FacilityMaintenanceVO> selectFacilityMaintenance();
	public int insertFacilityMaintenance(FacilityMaintenanceVO mtnVO);
	public List<FacilityOperationVO> selectFacilityOperation();
	public List<FacilityDownVO> getFacilityDownCode();
	public List<FacilityOperationStatVO> facilityOperationStat();
	public int getNextDownCode();
}
