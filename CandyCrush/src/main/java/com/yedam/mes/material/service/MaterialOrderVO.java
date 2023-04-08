package com.yedam.mes.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialOrderVO {
	private String moCd;
	private String moTitle;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date moReoDt;
	private int moCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date moReqDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date moCpltDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date moUdtDt;
	private String moMng;
	private String caNo;
	private String caNm;
	private String cmmCd;
	private int cmmInven;	//입고재고-출고재고
}
