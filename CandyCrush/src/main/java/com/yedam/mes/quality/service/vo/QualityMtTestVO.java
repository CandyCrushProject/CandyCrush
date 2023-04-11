package com.yedam.mes.quality.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class QualityMtTestVO {//주문서조회, 품질관리 등록용
	private String miCd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date miDt;
	private String miMng;
	private int miCnt;
	private int miBadCnt;
	private int miPassCnt;
	private String moCd;
	private String miNote;	
}
