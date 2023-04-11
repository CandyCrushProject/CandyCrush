package com.yedam.mes.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialOrderVO {
	private String modCd;		//발주상세코드
	private String moCd;		//발주코드
	private String moTitle;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date moReoDt;		//발주신청일
	private int moCnt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date moReqDt;		//납기요청일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date moCpltDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date moUdtDt;
	private String moMng;
	private String caNo;		//업체코드
	private String caNm;		//업체명
	private String cmmCd;		//자재코드
	private String cmmNm;		//자재명
	private int cmmInven;		//입고재고-출고재고
	private int cmmEstInven;	//입고재고-출고재고+발주재고 
	private String cmmSafStc;	//안전재고
	
	//날짜검색
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String start;	//시작일자
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String end;		//종료일자
}
