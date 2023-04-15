package com.yedam.mes.material.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.material.service.MaterialInputVO;
import com.yedam.mes.material.service.MaterialOrderVO;
import com.yedam.mes.material.service.MaterialVO;
import com.yedam.mes.material.service.MtrlAccountVO;

public interface MaterialMapper {
	//업체조회
	public List<MtrlAccountVO> accountCheck();
	//모달 업체검색
	public List<MtrlAccountVO> accountCheckModal(@Param("caNm") String caNm, @Param("caNo") String caNo);
	//업체명 또는 자재명을 통한 자재검색
	public List<MaterialVO> mtrlSearch(@Param("caNm") String caNm, @Param("cmmNm") String cmmNm);
	//업체명 또는 발주신청일 시작일자 ~ 종료일자 검색
	public List<MaterialOrderVO> mtrlOrderDateSearch(@Param("caNm") String caNm,
													 @Param("start") String start,
													 @Param("end") String end);
	//자재목록에서 자재코드 클릭하면 자재발주로 리스트를 뿌린다
	public List<MaterialOrderVO> mtrlOrderOneCheck(@Param("cmmCd") String cmmCd);
	
	//자재발주목록에서 발주코드 클릭하면 발주상세목록을 모달로 띄운다 / 20230409
	public List<MaterialOrderVO> mtrlOrderDetailList(@Param("moCd") String moCd);
	
	//자재발주코드 자동생성
	//public MaterialOrderVO getMtrlOrderCode();
	
	//--발주등록
	//발주관리 헤더
	public int orderHeaderInsert(MaterialOrderVO vo);
	//발주관리 디테일
	public int orderDetailInsert(MaterialOrderVO vo);
	
	//--발주삭제
	//발주번호 기반으로 헤더와 디테일의 데이터를 동시에 지운다
	public int orderDelete(@Param("delMocd") String delMocd);
	
	//발주상세코드를 기반으로 디테일 데이터를 지운다
	public int orderDetailDelete(MaterialOrderVO vo);
	
	//발주 디테일 데이터 수정
	public int orderDetailUpdate(@Param("moCnt") int moCnt,
								 @Param("moReqDt") Date moReqDt,
								 @Param("moCd") String moCd,
								 @Param("cmmCd") String cmmCd);
	
	//--발주입고관리
	//검사일자 : 시작일자 ~ 종료일자 & 업체명을 통한 데이터 조회
	public List<MaterialInputVO> mtrlInputGetList(@Param("caNm") String caNm,
												  @Param("start") String start,
												  @Param("end") String end);
	//입고목록 -> 7일 이내
	public List<MaterialInputVO> mtrlInputList7Days();
	
	//입고목록 -> 입고상세
	public List<MaterialInputVO> mtrlInputDetailList(@Param("minCd") String minCd);
	
	//입고등록
	public int mtrlInputInsert(List<MaterialInputVO> vo);
	
	//LOT등록
	public int mtrlLotInsert(List<MaterialInputVO> vo);
	
	//진행여부 업데이트
	public int mtrlMoSttUpdate(MaterialInputVO vo);
	
	
}
