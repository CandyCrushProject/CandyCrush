package com.yedam.mes.quality.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class MtInspInsertVO {//검사기록 input용
	private String miCd;
	private String modCd;
	private Date miDt;
	private String miMng;
	private int miCnt;
	private int miBadCnt;
	private int miPassCnt;
}
