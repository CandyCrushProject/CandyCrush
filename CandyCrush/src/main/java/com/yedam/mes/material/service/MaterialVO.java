package com.yedam.mes.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialVO {
	private String cmmCd;	//자재코드
	private String cmmNm;	//자재명
	private String cmmTyp;	//자재유형
	private String cmmSpec;	//자재규격
	private String cmmUnit;	//자재단위
	private int cmmSafStc;	//안전재고
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cmmStartDt;//등록일
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cmmUpdDt;	//수정일
	private String caNo;	//거래처코드
	private String caNm;	//거래처명
	private int minCnt;		//입고재고
	private int cmmInven;	//입고재고-출고재고
	private int cmlInCnt;	//LOT 입고량
	private String cmlNm;	//LOT번호
	
	//출고
	private String motCd;	//출고코드
	private int motCnt;		//출고재고
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date motDt;		//출고일자
	private String motTyp;	//출고타입
	private String motNote;	//상세정보
	private String motMng;	//담당자
	private String minCd;	//입고코드
	private int motCdCnt;	//출고코드기준 상세개수
}
