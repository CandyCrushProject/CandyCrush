package com.yedam.mes.facility.mapper;

import java.util.List;

import com.yedam.mes.facility.service.vo.FacilityDownVO;
import com.yedam.mes.facility.service.vo.FacilityMaintenanceVO;
import com.yedam.mes.facility.service.vo.FacilityOperationStatVO;
import com.yedam.mes.facility.service.vo.FacilityOperationVO;
import com.yedam.mes.facility.service.vo.FacilityStatVO;

public interface FacilityMapper {
	public List<FacilityStatVO> selectFacilityStat(); //시설 현재정보 조회
	public List<FacilityMaintenanceVO> selectFacilityMaintenance(); //시설 점검정보 조회
	public int insertFacilityMaintenance(FacilityMaintenanceVO mtnVO); //시설 점검기록 입력
	public List<FacilityOperationVO> selectFacilityOperation(); //시설 비가동 조회
	public List<FacilityDownVO> getFacilityDownCode(); //시설 비가동코드 조회
	public List<FacilityOperationStatVO> facilityOperationStat(); //시설 비가동 현황조회
	public int insertFacilityAbortOpertation(FacilityOperationVO oprVO); // 시설 비(중단)가동 입력
	public int insertFacilityRestartOpertation(FacilityOperationVO oprVO); // 시설 재가동 입력
	public int updateFacilityOpertationStat(FacilityOperationVO oprVO);//시설상태 가동비가동 Y,N 업데이트
}
