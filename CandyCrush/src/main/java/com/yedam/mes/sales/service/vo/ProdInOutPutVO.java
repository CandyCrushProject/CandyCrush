package com.yedam.mes.sales.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProdInOutPutVO {

	// 공통
	private String orshNo; // 주문서 번호
	private String caNm; // 거래처명
	private String orshDt; // 주문일자
	private String dlvryDt; // 납기일자
	
	private String ordrDtlCd; // 주문서디테일 주문코드
	private String ordrDtlCnt; // 주문서디테일 주문수량
	private String orshPr; // 주문서디테일 현재상태
	private String sttCngDt; // 주문서디테일 상태변경일자
	
	private String piPassCnt; // 제품검사코드
	
	private String cprCd; // 제품코드
	private String cprNm; // 제품명
	private int sumPlsCnt; // 제품재고
	
	private String prcmPrcd; // 공정지시코드
	private String prprQnt; // 생산량
	
	private String memNm; // 멤버이름
	private String memId; // 멤버아이디

	// 제품입고
	private String prodRcvNo; // 제품입고번호
	private String plsNo; // 제품LOT번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pinDt; // 제품입고일자
	private int pinCnt; // 제품입고수량
	private String inputMng; // 입고 담당자

	// 제품출고
	private String prodShpmntNo; // 제품출고번호
	private String prodLotNo; // 제품 LOT번호
	private String orderNo; // 주문서번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prodShpmntDt; // 제품출고일자
	private String prodShpmntCnt; // 제품출고수량
	private String caNo; // 거래처코드
	private String ouputMng; // 출고 담당자

}