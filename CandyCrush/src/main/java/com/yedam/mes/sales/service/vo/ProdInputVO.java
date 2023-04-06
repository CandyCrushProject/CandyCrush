package com.yedam.mes.sales.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProdInputVO {

	// 제품입고
	private String prodRcvNo; // 제품입고번호
	private String plsNo; // 제품LOT번호
	private String cprCd; // 제품코드
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date pinDt; // 제품입고일자
	private int pinCnt; // 제품입고수량

}