package com.yedam.mes.facility.mapper;

import java.util.List;

import com.yedam.mes.facility.service.FacilityMaintenanceVO;
import com.yedam.mes.facility.service.FacilityStatVO;

public interface FacilityMapper {
	public List<FacilityStatVO> selectFacilityStat();
	public List<FacilityMaintenanceVO> selectFacilityMaintenance();
}
