package com.yedam.mes.process.vo;

import lombok.Data;

@Data
public class OrderPlanVO {
	
	// 생산계획에서 정보 부를때 쓸거
	private String orshNo; // 주문서번호
	private String caNo; // 거래처코드
	private String caNm; // 거래처이름
	private String orshDt; // 주문일자
	private String orshPr; // 현재상황
	private int ordrDtlCnt; // 주문수량
	private String dlvryDt; // 납기일자
	private String cprCd; // 제품코드
	private String cprNm; // 제품명
	
	// bom
	private String cbmtCd; // bom자재코드
	private String cmmCd; // 자재코드
	private int cbmtCtt; // 자재소모수량
	private String cmCd; // 공정코드
	private String bomCd; // bom 코드
}
