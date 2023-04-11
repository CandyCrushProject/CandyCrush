package com.yedam.mes.material.mapper;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialInputVO {
	//자재관리
	private String cmmCd;	//자재코드
	private String cmmNm;	//자재명
	private String cmmTyp;	//자재유형
	private String cmmSpec;	//자재규격
	private String cmmUnit;	//자재단위
	
	//발주관리
	private String moCd;	//발주코드
	
	//거래처관리
	private String caNo;	//업체코드
	private String caNm;	//업체명
	
	//자재입고관리
	private int miPassCnt;	//합격수량(입고가능수량)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date miDt;		//검사일자
	
	//날짜검색
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String start;	//시작일자
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String end;		//종료일자
}
