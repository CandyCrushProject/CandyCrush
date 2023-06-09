CREATE TABLE ORDER_SHEET (
	ORSH_NO	VARCHAR2(50)		NOT NULL,
	CPR_CD	VARCHAR2(50)		NULL,
	CA_NO	VARCHAR2(50)		NULL,
	ORSH_DT	DATE		NULL,
	ORSH_PR	VARCHAR2(20)	DEFAULT '접수완료'	NOT NULL
);

CREATE TABLE CM_MTRL_MNG (
	CMM_CD	VARCHAR2(6)		NOT NULL,
	CMM_NM	VARCHAR2(50)		NULL,
	CMM_TYP	VARCHAR2(50)		NULL,
	CMM_SPEC	VARCHAR2(50)		NULL,
	CMM_UNIT	VARCHAR2(30)		NULL,
	CMM_SAF_STC	NUMBER		NULL,
	CMM_START_DT	DATE		NULL,
	CMM_UPD_DT	DATE		NULL
);

CREATE TABLE FAC (
	FAC_CD	VARCHAR2(50)		NOT NULL,
	FAC_NM	VARCHAR2(50)		NULL,
	FAC_CY	Number		NULL,
	FAC_INFO	VARCHAR(200)		NULL,
	FAC_DT	DATE		NULL
);

CREATE TABLE PROD_OUTPUT (
	PROD_SHPMNT_NO	VARCHAR2(50)		NOT NULL,
	PROD_LOT_NO	VARCHAR(50)		NULL,
	ORDER_NO	VARCHAR2(50)		NULL,
	PROD_SHPMNT_DT	DATE		NULL,
	PROD_SHPMNT_CNT	NUMBER(10)		NULL,
	CA_NO	VARCHAR2(50)		NULL,
	CPR_CD	VARCHAR2(50)		NULL
);

CREATE TABLE PROD_INPUT (
	PROD_RCV_NO	VARCHAR2(50)		NOT NULL,
	PLS_NO	VARCHAR2(50)		NULL,
	CPR_CD	VARCHAR2(50)		NULL,
	PIN_DT	DATE		NULL,
	PIN_CNT	NUMBER		NULL
);

CREATE TABLE FAC_INSP (
	FAC_MTN	VARCHAR2(50)		NOT NULL,
	FAC_CD	VARCHAR2(50)		NULL,
	FAC_RTN	VARCHAR2(50)		NULL,
	FAC_MTN_DT	DATE	DEFAULT SYSDATE	NULL,
	FAC_RSLT	VARCHAR2(50)		NULL,
	FAC_ACT	VARCHAR2(50)		NULL,
	FAC_ACT_DTL	VARCHAR(2000)		NULL,
	FAC_MGR	VARCHAR(20)		NULL
);

CREATE TABLE PROD_LOT_STOCK (
	PLS_NO	VARCHAR2(50)		NOT NULL,
	PLS_CNT	NUMBER		NULL,
	PLS_IN_CNT	NUMBER		NULL,
	PLS_OUT_CNT	NUMBER		NULL,
	PLS_MK_DT	DATE		NULL,
	CPR_CD	VARCHAR2(50)		NULL,
	PI_CD	VARCHAR2(50)		NULL
);

CREATE TABLE MTRL_INPUT (
	MIN_CD	VARCHAR2(50)		NOT NULL,
	MIN_CNT	NUMBER		NULL,
	MIN_DT	DATE	DEFAULT SYSDATE	NULL,
	MIN_UDT_DT	DATE		NULL,
	MIN_MNG	VARCHAR2(30)		NULL,
	MI_CD	VARCHAR(10)		NULL
);

CREATE TABLE CM_CODE (
	CMN_CD	VARCHAR2(20)		NOT NULL,
	CMN_NM	VARCHAR2(20)		NULL,
	CMN_DSC	VARCHAR2(200)		NULL
);

CREATE TABLE MTRL_OTPT (
	MOT_CD	VARCHAR2(50)		NOT NULL,
	MOT_CNT	NUMBER		NULL,
	MOT_DT	DATE	DEFAULT SYSDATE	NULL,
	MOT_TYP	VARCHAR(50)		NULL,
	MOT_NOTE	VARCHAR2(400)		NULL,
	MOT_MNG	VARCHAR2(50)		NULL,
	CML_NM	VARCHAR2(10)		NULL
);

CREATE TABLE CM_CODE_DETAIL (
	CMN_DTL_CD	VARCHAR2(20)		NOT NULL,
	CMN_DTL	VARCHAR2(20)		NULL,
	CMN_DTL_DSC	VARCHAR2(2000)		NULL,
	CMN_CD	VARCHAR2(20)		NULL
);

CREATE TABLE CM_MTRL_LOT (
	CML_NM	VARCHAR2(10)		NOT NULL,
	CML_CNT	NUMBER		NULL,
	CML_IN_CNT	NUMBER		NULL,
	CML_OUT_CNT	NUMBER		NULL,
	CML_IN_DT	DATE		NULL,
	CML_EXP_DT	DATE		NULL,
	CMM_CD	VARCHAR2(6)		NULL,
	MIN_CD	VARCHAR2(50)		NULL
);

CREATE TABLE MTRL_INSP (
	MI_CD	VARCHAR2(10)		NOT NULL,
	MI_DT	DATE		NULL,
	MI_MNG	VARCHAR2(30)		NULL,
	MI_CNT	NUMBER		NULL,
	MI_BAD_CNT	NUMBER		NULL,
	MI_PASS_CNT	NUMBER		NULL,
	MI_NOTE	VARCHAR2(400)		NULL,
	MO_CD	VARCHAR2(50)		NULL
);

CREATE TABLE MTRL_BAD_HSTR (
	MBH_CD	VARCHAR2(50)		NOT NULL,
	MBH_CNT	NUMBER		NULL,
	MBH_NOTE	VARCHAR2(400)		NULL,
	MI_CD	VARCHAR2(10)		NULL,
	CMB_CD	VARCHAR(50)		NULL
);

CREATE TABLE MTRL_ORDR (
	MO_CD	VARCHAR2(50)		NOT NULL,
	MO_TITLE	VARCHAR2(100)		NULL,
	MO_REO_DT	DATE		NULL,
	MO_CNT	NUMBER		NULL,
	MO_DLV_DT	DATE		NULL,
	MO_CPLT_DT	DATE		NULL,
	MO_UDT_DT	DATE		NULL,
	MO_MNG	VARCHAR2(30)		NULL,
	CA_NO	VARCHAR2(50)		NULL,
	CMM_CD	VARCHAR2(6)		NULL
);

CREATE TABLE CM_ACCOUNT (
	CA_NO	VARCHAR2(50)		NOT NULL,
	CA_NM	VARCHAR2(50)		NULL,
	CA_BSNS_NUM	VARCHAR2(50)		NULL,
	CA_CEO_NM	VARCHAR2(50)		NULL,
	CA_ADDR	VARCHAR2(50)		NULL,
	CA_PH	VARCHAR2(50)		NULL,
	CA_MNG	VARCHAR2(50)		NULL,
	CA_MNG_PH	VARCHAR2(50)		NULL,
	CA_TYP	VARCHAR2(50)		NULL
);

CREATE TABLE CM_MEMBER (
	MEM_ID	VARCHAR2(100)		NOT NULL,
	MEM_PASS	VARCHAR2(50)		NULL,
	MEM_NM	VARCHAR2(20)		NULL,
	MEM_PH	VARCHAR2(20)		NULL,
	MEM_AUT	VARCHAR2(20)		NULL,
	MEM_HIRE_DT	DATE	DEFAULT SYSDATE	NULL,
	MEM_QUIT_DT	DATE		NULL,
	DEPT_CD	VARCHAR(50)		NULL
);

CREATE TABLE CM_PRODUCT_MNG (
	CPR_CD	VARCHAR2(50)		NOT NULL,
	CPR_NM	VARCHAR2(50)		NULL,
	CPR_UNIT	VARCHAR2(50)		NULL,
	CPR_SPEC	VARCHAR2(50)		NULL,
	CPR_START_DT	DATE		NULL,
	CPR_UPD_DT	DATE		NULL,
	CPR_TYP	VARCHAR2(50)		NULL
);

CREATE TABLE CM_MTRL_BAD_CODE (
	CMB_CD	VARCHAR2(50)		NOT NULL,
	CMB_NM	VARCHAR2(300)		NULL,
	CMB_CTT	VARCHAR2(500)		NULL,
	CMB_START_DT	DATE		NULL,
	CMB_UPD_DT	DATE		NULL
);

CREATE TABLE CM_DEPARTMENT (
	DEPT_CD	VARCHAR2(20)		NOT NULL,
	DEPT_NM	VARCHAR(100)		NULL,
	DEPT_START_DT	DATE	DEFAULT SYSDATE	NULL,
	DEPT_UPD_TD	DATE		NULL
);

CREATE TABLE PROC_PLAN (
	PRPL_CD	VARCHAR2(50)		NOT NULL,
	ORSH_NO	VARCHAR2(50)		NULL,
	PRPL_REQ_CNT	NUMBER		NULL,
	PRPL_DT	DATE		NULL,
	PRPL_DLVRY_DT	DATE		NULL,
	PRPL_STATUS	VARCHAR2(20)		NULL
);

CREATE TABLE ORDER_SHEET_DETAIL (
	ORDR_DTL_CD	VARCHAR2(50)		NOT NULL,
	ORDR_DTL_CNT	NUMBER		NULL,
	DLVRY_DT	DATE		NULL,
	CPR_CD	VARCHAR2(50)		NULL,
	ORSH_NO	VARCHAR2(50)		NOT NULL
);

CREATE TABLE PROC_PLAN_DETAIL (
	PRPLD_CD	VARCHAR2(50)		NOT NULL,
	PRPLD_WORK_TSK_PRI	VARCHAR2(10)		NULL,
	CPR_CD	VARCHAR2(50)		NULL,
	PRPLD_CNT	NUMBER		NULL,
	PRST_DT	DATE		NULL,
	PRPLD_MNG	VARCHAR2(30)		NULL,
	PRPLD_STATUS	VARCHAR2(20)		NULL,
	PRPL_CD	VARCHAR2(50)		NULL
);

CREATE TABLE PROC_COMMAND (
	PRCM_CD	VARCHAR2(50)		NOT NULL,
	PRPL_CD	VARCHAR2(50)		NULL,
	PRCM_DT	DATE		NULL,
	PRCM_MNG	VARCHAR2(50)		NULL
);

CREATE TABLE PROC_COMMAND_DETAIL (
	PRCM_WORK_CD	VARCHAR2(10)		NOT NULL,
	PRCM_CD	VARCHAR(50)		NULL,
	PRCM_CNT	NUMBER		NULL,
	PRCM_START_DT	DATE		NULL,
	PRCM_END_DT	DATE		NULL,
	CM_CD	VARCHAR2(50)		NULL,
	PRC_TURN	NUMBER		NULL,
	CPR_CD	VARCHAR2(50)		NULL
);

CREATE TABLE CM_BOM_MNG (
	BOM_CD	VARCHAR2(50)		NOT NULL,
	PROD_CD	VARCHAR2(50)		NULL,
	BOM_START_DT	DATE		NULL,
	BOM_UPD_DT	DATE		NULL
);

CREATE TABLE CM_PROCESS_CODE (
	CM_CD	VARCHAR2(50)		NOT NULL,
	FAC_CD	VARCHAR2(50)		NULL,
	CM_NM	VARCHAR2(50)		NULL,
	CM_CONTENT	VARCHAR2(500)		NULL
);

CREATE TABLE PRDCT_INSPC (
	PI_CD	VARCHAR2(50)		NOT NULL,
	PI_DT	DATE		NULL,
	PI_STR_DT	DATE		NULL,
	PI_END_DT	DATE		NULL,
	PI_MNG	VARCHAR2(30)		NULL,
	PI_CNT	NUMBER		NULL,
	PI_BAD_CNT	NUMBER		NULL,
	PI_PASS_CNT	NUMBER		NULL,
	COMM_CD	VARCHAR2(50)		NULL,
	CM_CD	VARCHAR2(50)		NULL,
	CPR_CD	VARCHAR2(50)		NULL,
	PI_NOTE	VARCHAR2(400)		NULL
);

CREATE TABLE CM_INSPC_STNDR (
	CIS_CD	VARCHAR2(50)		NOT NULL,
	CIS_NM	VARCHAR2(100)		NULL,
	CIS_CTT	VARCHAR2(300)		NULL,
	CIS_IN_DT	DATE		NULL,
	CIS_UPD_DT	DATE		NULL
);

CREATE TABLE FAC_DWN_MNG (
	FDM_CD	VARCHAR2(50)		NOT NULL,
	FDM_MGR	VARCHAR2(50)		NULL,
	FDM_STOP	DATE		NULL,
	FDM_RUN	DATE		NULL,
	FAC_CD	VARCHAR2(50)		NULL,
	CFD_CD	VARCHAR2(50)		NULL
);

CREATE TABLE PROC_PROGRESS (
	PRPR_PRCD	VARCHAR2(50)		NOT NULL,
	PRPR_TURN	NUMBER		NULL,
	PRPR_IN_QNT	NUMBER		NULL,
	PRPR_QNT	NUMBER		NULL,
	PRPR_BAD_QNT	NUMBER		NULL,
	PRPR_CMPLT_STT	VARCHAR2(30)		NULL,
	PRCM_CD	VARCHAR2(50)		NULL,
	CM_CD	VARCHAR2(50)		NULL
);

CREATE TABLE PROC_PERF (
	PRPE_CD	VARCHAR2(50)		NOT NULL,
	PRPE_MNG	VARCHAR2(50)		NULL,
	PRPE_WK_START_DT	DATE		NULL,
	PRPE_WK_END_DT	DATE		NULL,
	PRPE_BAD_QNT	NUMBER		NULL,
	PRPE_AMNT_WK	NUMBER		NULL,
	CPR_CD	VARCHAR2(50)		NULL,
	PRCM_CD	VARCHAR2(50)		NULL,
	CM_CD	VARCHAR2(50)		NULL
);

CREATE TABLE PROC_MTRL_PROGRESS (
	PRMP_WK_NO	VARCHAR2(10)		NOT NULL,
	CM_CD	VARCHAR2(50)		NULL,
	PRCM_CD	VARCHAR2(50)		NULL,
	CMM_CD	VARCHAR2(50)		NULL,
	PRMP_PUT_QNT	NUMBER		NULL
);

CREATE TABLE CM_BOM_MNFCT (
	CBM_CD	VARCHAR2(50)		NOT NULL,
	CM_CD	VARCHAR2(50)		NULL,
	CM_SQ	NUMBER		NULL,
	PROD_CD	VARCHAR(50)		NULL
);

CREATE TABLE CM_BOM_MTRL (
	CBMT_CD	VARCHAR2(50)		NOT NULL,
	CM_CD	VARCHAR2(50)		NULL,
	CMM_CD	VARCHAR2(50)		NULL,
	CBMT_QTT	NUMBER		NULL
);

CREATE TABLE CM_FAC_DWN_CODE (
	CFD_CD	VARCHAR2(50)		NOT NULL,
	CFD_TITLE	VARCHAR2(100)		NULL,
	CFD_CONTENT	VARCHAR2(400)		NULL,
	CFD_START_DT	DATE		NULL,
	CFD_UPT_DT	DATE		NULL
);

CREATE TABLE FAC_STAT (
	FAC_CD	VARCHAR2(50)		NOT NULL,
	FAC_RUN	VARCHAR2(2)	DEFAULT 'N'	NULL
);

ALTER TABLE ORDER_SHEET ADD CONSTRAINT PK_ORDER_SHEET PRIMARY KEY (
	ORSH_NO
);

ALTER TABLE CM_MTRL_MNG ADD CONSTRAINT PK_CM_MTRL_MNG PRIMARY KEY (
	CMM_CD
);

ALTER TABLE FAC ADD CONSTRAINT PK_FAC PRIMARY KEY (
	FAC_CD
);

ALTER TABLE PROD_OUTPUT ADD CONSTRAINT PK_PROD_OUTPUT PRIMARY KEY (
	PROD_SHPMNT_NO
);

ALTER TABLE PROD_INPUT ADD CONSTRAINT PK_PROD_INPUT PRIMARY KEY (
	PROD_RCV_NO
);

ALTER TABLE FAC_INSP ADD CONSTRAINT PK_FAC_INSP PRIMARY KEY (
	FAC_MTN
);

ALTER TABLE PROD_LOT_STOCK ADD CONSTRAINT PK_PROD_LOT_STOCK PRIMARY KEY (
	PLS_NO
);

ALTER TABLE MTRL_INPUT ADD CONSTRAINT PK_MTRL_INPUT PRIMARY KEY (
	MIN_CD
);

ALTER TABLE CM_CODE ADD CONSTRAINT PK_CM_CODE PRIMARY KEY (
	CMN_CD
);

ALTER TABLE MTRL_OTPT ADD CONSTRAINT PK_MTRL_OTPT PRIMARY KEY (
	MOT_CD
);

ALTER TABLE CM_CODE_DETAIL ADD CONSTRAINT PK_CM_CODE_DETAIL PRIMARY KEY (
	CMN_DTL_CD
);

ALTER TABLE CM_MTRL_LOT ADD CONSTRAINT PK_CM_MTRL_LOT PRIMARY KEY (
	CML_NM
);

ALTER TABLE MTRL_INSP ADD CONSTRAINT PK_MTRL_INSP PRIMARY KEY (
	MI_CD
);

ALTER TABLE MTRL_BAD_HSTR ADD CONSTRAINT PK_MTRL_BAD_HSTR PRIMARY KEY (
	MBH_CD
);

ALTER TABLE MTRL_ORDR ADD CONSTRAINT PK_MTRL_ORDR PRIMARY KEY (
	MO_CD
);

ALTER TABLE CM_ACCOUNT ADD CONSTRAINT PK_CM_ACCOUNT PRIMARY KEY (
	CA_NO
);

ALTER TABLE CM_MEMBER ADD CONSTRAINT PK_CM_MEMBER PRIMARY KEY (
	MEM_ID
);

ALTER TABLE CM_PRODUCT_MNG ADD CONSTRAINT PK_CM_PRODUCT_MNG PRIMARY KEY (
	CPR_CD
);

ALTER TABLE CM_MTRL_BAD_CODE ADD CONSTRAINT PK_CM_MTRL_BAD_CODE PRIMARY KEY (
	CMB_CD
);

ALTER TABLE CM_DEPARTMENT ADD CONSTRAINT PK_CM_DEPARTMENT PRIMARY KEY (
	DEPT_CD
);

ALTER TABLE PROC_PLAN ADD CONSTRAINT PK_PROC_PLAN PRIMARY KEY (
	PRPL_CD
);

ALTER TABLE ORDER_SHEET_DETAIL ADD CONSTRAINT PK_ORDER_SHEET_DETAIL PRIMARY KEY (
	ORDR_DTL_CD
);

ALTER TABLE PROC_PLAN_DETAIL ADD CONSTRAINT PK_PROC_PLAN_DETAIL PRIMARY KEY (
	PRPLD_CD
);

ALTER TABLE PROC_COMMAND ADD CONSTRAINT PK_PROC_COMMAND PRIMARY KEY (
	PRCM_CD
);

ALTER TABLE PROC_COMMAND_DETAIL ADD CONSTRAINT PK_PROC_COMMAND_DETAIL PRIMARY KEY (
	PRCM_WORK_CD
);

ALTER TABLE CM_BOM_MNG ADD CONSTRAINT PK_CM_BOM_MNG PRIMARY KEY (
	BOM_CD
);

ALTER TABLE CM_PROCESS_CODE ADD CONSTRAINT PK_CM_PROCESS_CODE PRIMARY KEY (
	CM_CD
);

ALTER TABLE PRDCT_INSPC ADD CONSTRAINT PK_PRDCT_INSPC PRIMARY KEY (
	PI_CD
);

ALTER TABLE CM_INSPC_STNDR ADD CONSTRAINT PK_CM_INSPC_STNDR PRIMARY KEY (
	CIS_CD
);

ALTER TABLE FAC_DWN_MNG ADD CONSTRAINT PK_FAC_DWN_MNG PRIMARY KEY (
	FDM_CD
);

ALTER TABLE PROC_PROGRESS ADD CONSTRAINT PK_PROC_PROGRESS PRIMARY KEY (
	PRPR_PRCD
);

ALTER TABLE PROC_PERF ADD CONSTRAINT PK_PROC_PERF PRIMARY KEY (
	PRPE_CD
);

ALTER TABLE PROC_MTRL_PROGRESS ADD CONSTRAINT PK_PROC_MTRL_PROGRESS PRIMARY KEY (
	PRMP_WK_NO
);

ALTER TABLE CM_BOM_MNFCT ADD CONSTRAINT PK_CM_BOM_MNFCT PRIMARY KEY (
	CBM_CD
);

ALTER TABLE CM_BOM_MTRL ADD CONSTRAINT PK_CM_BOM_MTRL PRIMARY KEY (
	CBMT_CD
);

ALTER TABLE CM_FAC_DWN_CODE ADD CONSTRAINT PK_CM_FAC_DWN_CODE PRIMARY KEY (
	CFD_CD
);

ALTER TABLE FAC_STAT ADD CONSTRAINT PK_FAC_STAT PRIMARY KEY (
	FAC_CD
);
