package com.yedam.mes.process.vo;

import lombok.Data;

@Data
public class OrderPlanVO {
	
	// 생산계획에서 정보 부를때 쓸거
	private String ordrDtlCd; // 주문서디테일코드
	private String orshNo; // 주문서번호
	private String caNo; // 거래처코드
	private String caNm; // 거래처이름
	private int ordrDtlCnt; // 주문수량
	private String dlvryDt; // 납기일자
	private String orshDt; // 주문일자
	private String orshPr; // 현재상태
	private String cprCd; // 제품코드
	private String cprNm; // 제품명
	private String sttCngDt; // 상태변경일자
	private int ordrCdCnt; // 주문건수
	private String sumDtlCnt; // 상품별 주문 개수
	private String plsNo; // 제품로트번호
	private String plsCnt; // 제품로트 입고량
	private int plsCntSum; // 제품 총 합계
	private int stockInven; // 자재재고
	private String cmmSpec; // 자재 단위
	private String cmmCd; // 자재 코드
	private String cmmNm; // 자재 이름
}
