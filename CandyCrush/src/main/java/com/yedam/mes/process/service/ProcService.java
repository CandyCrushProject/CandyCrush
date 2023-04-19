package com.yedam.mes.process.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.process.vo.BomInfoVO;
import com.yedam.mes.process.vo.OrderPlanVO;
import com.yedam.mes.process.vo.ProcOrderVO;
import com.yedam.mes.process.vo.ProcPerfVO;
import com.yedam.mes.process.vo.ProcPlanVO;
import com.yedam.mes.process.vo.ProcProgVO;
import com.yedam.mes.process.vo.ProcResultAllVO;

public interface ProcService {

	/* 생산계획 매퍼 시작 */

	// 생산계획 - 제품코드 불러오기
	public List<OrderPlanVO> getCprCdList();
	
	// 생산계획 - 주문서 읽어오기
	public List<OrderPlanVO> getOrder();
	
	// 생산계획 - 주문상세코드 가져오기
	public List<OrderPlanVO> getOrdrDtlCd(@Param("orshNo")String[] orshNo);
	
	// 생산계획 - 주문서 접수완료 -> 계획완료 변경
	public int updateOrderStatus(@Param("orshNo")String[] orshNo);
	
	// 미계획 주문서에 대한 상세 정보 목록
	public List<OrderPlanVO> getOrderDetail(OrderPlanVO opVO);
	
	// 미계획 주문서 체크 후 추가 버튼 누르면 계획 등록 폼으로 이동
	public List<OrderPlanVO> addPlanbefore(@Param("orshNo")String[] orshNo);
	
	
	// 생산계획등록 - 읽어온 주문서의 정보로 계획 등록하는거
	public int addPlan(ProcPlanVO planVO); // 생산계획 헤더
	public int addPlanDetail(List<ProcPlanVO> planVO); // 디테일
	
	// 제품공정확인 - 제품마다 사용되는 공정정보
	public List<BomInfoVO> getBom(OrderPlanVO opVO);
	// 자재확인 - 자재입고된 로트조회
	public List<BomInfoVO> selectMtrlInput(BomInfoVO biVO);

	public List<ProcPlanVO> searchPlanList(ProcPlanVO ppVO); 
	
	// 공정자재 - 공정 등록
	public int insertProgressOne(ProcOrderVO poVO);
	// 공정자재 - 공정 등록
	public int insertProgressFull(List<ProcOrderVO> poVO);
	// 자재지시 - 공정에 들어갈 자재 등록
	public int insertProgMtrl(List<ProcOrderVO> poVO);
	

	// 생산계획시 보이는 자재 재고 및 로트정보
	public List<OrderPlanVO> findMtrlCntSum(OrderPlanVO opVO);
	public List<OrderPlanVO> findMtrlLot(OrderPlanVO opVO);
	
	// 담당자 목록 불러오기
	public List<ProcPlanVO> getManagerList();
	
	
	
	
	
	
	/* 생산계획 매퍼 끝 */
	
	/* 생산지시 매퍼 시작 */
	
	// 생산계획조회 - 생산계힉정보를 넘겨받음
	public List<ProcPlanVO> getPlan(); 
	
	// 생산지시저장 - 조회된 계획으로 지시를 내릴 수 있다.
	public int addOrder(ProcOrderVO orderVO);
	
	// 공정자재 - 공정의 자재 정보
	
	// 자재지시 - 공정에 들어갈 자재 정보
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	/* 생산지시 매퍼 끝 */
	
	/* 생산공정 매퍼 시작 */
	
	// 지시조회 - 지시된 건의 정보를 넘겨받음
	public List<ProcOrderVO> getOrderList();
	
	// 진행생산지시 - 지시된 생산 정보에 대해 넘어옴
	public ProcOrderVO getOrder(ProcOrderVO orderVO);
	
	// 공정이동표 - 공정마다 이동된 실적정보가 넘어감 (공정실적에서 가져옴)
	// 공정목록 - 지시된 생산 정보에서의 공정목록 정보를 불러옴 한 제품이 거치는 공정정보들이 다나옴 
	public List<ProcPerfVO> getPerfList(ProcPerfVO perfVO);
	public List<ProcProgVO> getProgList(ProcProgVO progVO);
	
	/* 생산공정 매퍼 끝 */
	
	
	
	
	
	
	
	//실적페이지 지시조회용========================== 이하 실적페이용=========
	
	public List<ProcResultAllVO> getProcCommand();
	public List<ProcResultAllVO> getProc(@Param("prcmCd")String prcmCd);
	public List<ProcResultAllVO> getProcFac(@Param("prcmPrcd") String prcmPrcd);
	public List<ProcResultAllVO> getProcProg();
	public int startProg(ProcResultAllVO startVO);
	public List<ProcResultAllVO> getBadCd();
	public List<ProcResultAllVO> selectProcMtrl(@Param("prcmPrcd") String prcmPrcd);
	public int insertResult(List<ProcResultAllVO> finishVO);
	public List<ProcResultAllVO> getProcResult();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
