package com.yedam.mes.quality.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProdInspVO {
	//생산지시관리
	private String prcmCd;			//생산지시코드
	private String prcmPrcd;		//공정지시코드
	private String prprEnd;			//공정상태 -> N, Y
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String prcmStartDt;		//생산시작일자
	private String PrcmEndDt;		//생산종료일자
	private int prcmCnt;			//생산지시수량
	private String prcmDt;			//생산지시일자
	private String prpeMng;			//담당자
	private	String prpeWkStartDt;	//작업시작일
	private String prpeWkEndDt;		//작업종료일
	private int prcmQnt;			//생산지시량
	private int prprQnt;			//생산량
	private int prprBad;			//불량량
	private String cmCd;			//공정코드
	
	//자재관리
	private String cprCd;		//제품코드
	private String cprNm;		//제품명
	private String cprTyp;		//제품유형
	
	//제품검사관리
	private String piCd;		//검사코드
	private String piDt;		//검사일자
	private String piStrDt;		//검사시작일
	private String piEndDt;		//검사종료일
	private int piCnt;			//검사량
	private int piBadCnt;		//불량량
	private int piPassCnt;		//합격량
	private String piNote;		//비고
	
	private String start;
	private String end;
}
