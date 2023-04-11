package com.yedam.mes.process.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mes.process.vo.BomInfoVO;
import com.yedam.mes.process.vo.OrderPlanVO;
import com.yedam.mes.process.vo.ProcOrderVO;
import com.yedam.mes.process.vo.ProcPerfVO;
import com.yedam.mes.process.vo.ProcPlanVO;
import com.yedam.mes.process.vo.ProcProgVO;

public interface ProcService {

	/* 생산계획 매퍼 시작 */
	
	// 생산계획 - 주문서 읽어오기
	public List<OrderPlanVO> getOrder();
	public int updateOrderStatus(OrderPlanVO opVO);
	public List<OrderPlanVO> getOrderDetail(OrderPlanVO opVO);
	
	public List<OrderPlanVO> addPlanbefore(@Param("orshNo")String[] orshNo,@Param("caNm")String[] caNm);
	
	public List<OrderPlanVO> getCprCd(OrderPlanVO opVO);
	
	// 생산계획등록 - 읽어온 주문서의 정보로 계획 등록하는거
	public String getPlanCode();
	public String getPlanDetailCode();
	public int addPlan(ProcPlanVO planVO);
	public int addPlanDetail(ProcPlanVO planVO);
	
	// 제품공정확인 - 제품마다 사용되는 공정정보
	public List<BomInfoVO> getBomMtrl(OrderPlanVO opVO);

	public List<ProcPlanVO> searchPlanList(ProcPlanVO ppVO); 
	
	/* 생산계획 매퍼 끝 */
	
	/* 생산지시 매퍼 시작 */
	
	// 생산계획조회 - 생산계힉정보를 넘겨받음
	public List<ProcPlanVO> getPlan(ProcPlanVO ppVO); 
	
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
}
