-- 주문서 더미데이터
INSERT INTO order_sheet (orsh_no, prod_cd, ca_no, orsh_dt, orsh_pr)
                 VALUES ('candyorder00001', 'candyprod001', '캔디크러쉬', TO_DATE('20230405', 'yyyy/MM/dd'), '계획완료');
                 
INSERT INTO order_sheet (orsh_no, prod_cd, ca_no, orsh_dt)
                 VALUES ('candyorder00002', 'candyprod002', '캔디크러쉬', TO_DATE('20230405', 'yyyy/MM/dd'));

INSERT INTO order_sheet (orsh_no, prod_cd, ca_no, orsh_dt, orsh_pr)
                 VALUES ('candyorder00003', 'candyprod003', '캔디크러쉬', TO_DATE('20230405', 'yyyy/MM/dd'), '생산중');
                 
INSERT INTO order_sheet (orsh_no, prod_cd, ca_no, orsh_dt, orsh_pr)
                 VALUES ('candyorder00004', 'candyprod004', '캔디크러쉬', TO_DATE('20230405', 'yyyy/MM/dd'), '출고완료');
                 
INSERT INTO order_sheet (orsh_no, prod_cd, ca_no, orsh_dt, orsh_pr)
                 VALUES ('candyorder00005', 'candyprod005', '캔디크러쉬', TO_DATE('20230405', 'yyyy/MM/dd'), '생산완료');

SELECT * FROM order_sheet;

-- 설비 더미데이터 
insert into FAC VALUES('FAC1','1호기테스트용',30,'1호기 정보','2022/01/01');
insert into FAC VALUES('FAC2','2호기테스트용',20,'2호기 정보','2023/01/01');

insert into FAC_INSP VALUES('MTN01','FAC1','정기','2022/01/01','합격','테스트점검1','테스트점검 상세1','김ㅇㅈ');
insert into FAC_INSP VALUES('MTN02','FAC1','정기','2022/01/05','합격','테스트점검2','테스트점검 상세2','김ㅇㅈ');

insert into FAC_DWN_MNG VALUES('FDM01','ㄱㅇㅈ','2022/12/11','2023/01/11','FAC1','더미 비가동코드');
insert into FAC_DWN_MNG VALUES('FDM02','ㄱㅇㅈ','2022/12/11',NULL,'FAC1','더미 비가동코드');
insert into FAC_DWN_MNG VALUES('FDM03','ㄱㅇㅈ','2023/01/11','2023/03/11','FAC2','더미 비가동코드');
insert into FAC_STAT VALUES('FAC1','N');
insert into FAC_STAT VALUES('FAC2','Y');

-- 제품관리 더미 데이터
insert into CM_PRODUCT_MNG
values( 'pro' || cpr_seq.nextval, 'test', 'kg', 'kg', sysdate, sysdate, '제품유형');

select * from CM_PRODUCT_MNG;
CREATE SEQUENCE cpr_seq;                