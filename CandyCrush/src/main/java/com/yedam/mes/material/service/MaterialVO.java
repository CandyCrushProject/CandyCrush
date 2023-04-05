package com.yedam.mes.material.service;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MaterialVO {
	private String cmmCd;
	private String cmmNm;
	private String cmmTyp;
	private String cmmSpec;
	private String cmmUnit;
	private int cmmSafStc;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cmmStartDt;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date cmmUpdDt;
}
