package com.yedam.mes.process.vo;

import lombok.Data;

@Data
public class BomInfoVO {
	// bom 자재 테이블
	private String ordrDtlCd; // 주문상세코드
	private String cbmtCd; // bom 자재코드
	private String cmCd; // 공정코드
	private String cmmCd; // 자재코드
	private String cmNm; // 공정명
	private String cmmNm; // 자재명
	private int cbmtQtt; // 자재소모수량
	private String bomCd; // bom 코드
	private String cprCd; // 제품코드
	private String cprNm; // 제품명
	private String crshNo; // 주문코드
	private String cbmCd; // bom공정코드
	private int cmSq; // 공정 순번
	private int cbmtCnsm; // 자재투입량
	private String cbmtMs; // 자재 단위
	
	// 공정 자재 사용 후 출고 위한 조회
	private String minCd; // 입고코드
	private String cmlNm; // 로뜨번호
	private String cmlInCnt; // 입고수량
	private String cmlInDt; // 입고일자
	
}
