package com.yedam.mes.common.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BomVO {
	//bom관리
	private String bomCd;		//bom코드
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bomStartDt;	//bom시작일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date bomUpdDt;		//bom수정일
	private String cbmCd;		//bom공정코드
	private int cmSq;			//공정순번
	private String cbmtCd;		//bom자재코드
	private int cbmtCnsm;		//자재소모량
	private String cbmtMs;		//자재단위
	
	//공정코드관리
	private String cmCd;		//공정코드
	private String cmNm;		//공정명
	private String cmContent;	//공정상세
	
	//완제품관리
	private String cprCd;		//제품코드
	private String cprNm;		//제품명
	private String cprUnit;		//제품단위
	private String cprSpec;		//제품규격
	private String cprTyp;		//제품유형
	
	//자재관리
	private String cmmCd;		//자재코드
	private String cmmNm;		//자재명
}
