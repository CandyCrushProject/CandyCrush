package com.yedam.mes.quality.service.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
@Data
public class MtInspBadInsertVO {//검사기록 input용
	private String mbhCd;
	private int mbhCnt;
	private String mbhNote;
	private String cmbCd;
	private String miCd;
}
