package com.yedam.mes.sales.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class OrdrShtVO {

	// 주문서
	private String orshNo; // 주문서번호
	private String caNo; // 거래처코드
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date orshDt; // 주문일자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dlvryDt; // 납기일자
	
	// @DateTimeFormat(pattern = "yyyy-MM-dd")
	private String orshStrDt; // 조회할때 시작날짜
	
	// @DateTimeFormat(pattern = "yyyy-MM-dd")
	private String orshEndDt; // 조회할때 마지막날짜
	
	// 주문서상세
	private String ordrDtlCd; // 주문코드
	private String ordrDtlCnt; // 주문수량
	private String cprCd; // 제품코드
	private String orshPr; // 현재상태
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sttCngDt; // 상태변경일자
	
	// 거래처
	private String caNm; // 거래처명
	private String caBsnsNum; // 사업자등록번호
	private String caCeoNm; // 대표자
	private String caAddr; //주소
	private String caPh; // 전화번호
	private String caMng; // 담당자
	private String caMngPh; // 담당자번호
	private String caTyp; // 거래처유형

}
