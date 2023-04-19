package com.yedam.mes.process.vo;

import lombok.Data;

@Data
public class ProcOrderVO {
	// 생산지시
	private String prcmCd; // 생산지시코드
	private String prcmCnt; // 생산지시수량
	private String cprCd; // 제품코드
	private String prcmDt; // 생산지시일자
	private String prcmStartDt; // 생산시작일자
	private String prcmEndDt; // 생산종료일자
	private String prcmMng; // 지시담당자
	private String prpldCd; // 계획상세코드
	private String prcmDeadline; // 생산마감일자

	// 공정지시
	private String prcmPrcd; // 공정지시코드
	private String cmCd; // 공정코드
	private int cmSq; // 공정순번
	private String prcmTurn; // 공정순번
	private int prcmQnt; // 생산지시량
	private int prprQnt; // 생산량
	private int prprBad; // 불량량
	private String prprEnd; // 공정상태
	
	private String cmmCd; // 자재코드
	private String cmmNm; // 자재명
	private String cbmtCd; // 자재bom코드
	private int prmpPutQnt; // 자재투입량
	private String prmpWkNo; //공정자재지시
}
