package com.yedam.mes.facility.mapper;

import java.util.List;

import com.yedam.mes.facility.service.FacilityDownVO;
import com.yedam.mes.facility.service.FacilityMaintenanceVO;
import com.yedam.mes.facility.service.FacilityOperationStatVO;
import com.yedam.mes.facility.service.FacilityOperationVO;
import com.yedam.mes.facility.service.FacilityStatVO;

public interface FacilityMapper {
	public List<FacilityStatVO> selectFacilityStat();
	public List<FacilityMaintenanceVO> selectFacilityMaintenance();
	public int insertFacilityMaintenance(FacilityMaintenanceVO mtnVO);
	public List<FacilityOperationVO> selectFacilityOperation();
	public List<FacilityDownVO> getFacilityDownCode();
	public List<FacilityOperationStatVO> facilityOperationStat();
}
