package com.yedam.mes.facility.service;

import java.util.List;

public interface FacilityService {
	public List<FacilityStatVO> selectFacilityStat();
	public List<FacilityMaintenanceVO> selectFacilityMaintenance();
	public int insertFacilityMaintenance(FacilityMaintenanceVO mtnVO);
	public List<FacilityOperationVO> selectFacilityOperation();
	public List<FacilityDownVO> getFacilityDownCode();
	public List<FacilityOperationStatVO> facilityOperationStat();
	public int getNextDownCode();
}
