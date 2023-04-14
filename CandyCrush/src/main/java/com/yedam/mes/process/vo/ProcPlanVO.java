package com.yedam.mes.process.vo;

import lombok.Data;

@Data
public class ProcPlanVO {
	// 생산계획
	private String prplCd; // 생산계획코드
	private String orshNo; // 주문서번호
	private String prplDt; // 생산계획일자
	private String prplSuceDt; // 납기일자
	private String prplStatus; // 완료여부
	private String prplMng; // 계획관리자

	// 생산계획디테일
	private String prpldCd; // 생산계획상세코드
	private String prpldWorkTskPri; // 작업우선순위
	private String cprCd; // 제품코드
	private String cprNm; // 제품명
	private int prpldCnt; // 생산계획수량
	private String prstDt; // 생산작업일자
	private String prpldMng; // 담당자
	private String prpldStatus; // 현재상황
	
	// 주문서
	private String ordrDtlCd; // 주문서상세코드
}