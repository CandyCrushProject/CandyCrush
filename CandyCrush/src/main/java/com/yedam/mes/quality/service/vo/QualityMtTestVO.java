package com.yedam.mes.quality.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class QualityMtTestVO {
	private String miCd;
	private String modCd;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date miDt;
	private String miMng;
	private int miCnt;
	private int miBadCnt;
	private int miPassCnt;
}
