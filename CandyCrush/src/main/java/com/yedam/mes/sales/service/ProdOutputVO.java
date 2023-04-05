package com.yedam.mes.sales.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProdOutputVO {

	// 제품출고
	private String prod_shpmnt_no; // 제품출고번호
	private String prod_lot_no; // 제품LOT번호
	private String order_no; // 주문서번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date prod_shpmnt_dt; // 제품출고일자
	private int prod_shpmnt_cnt; // 제품출고수량
	private String ca_no; // 거래처코드
	private String cpr_cd; // 제품코드

}
