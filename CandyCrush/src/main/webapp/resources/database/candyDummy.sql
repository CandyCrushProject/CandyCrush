-- 주문서 order_sheet
CREATE SEQUENCE order_sheet_seq;
DELETE FROM order_sheet;
INSERT INTO order_sheet (orsh_no, cpr_cd, ca_no, orsh_dt, orsh_pr)
                 VALUES ('candyorder'|| order_sheet_seq.nextval, 'candyprod001', 'yedam001', TO_DATE('20230405', 'yyyy/MM/dd'), '계획완료'); 
INSERT INTO order_sheet (orsh_no, CPR_CD, ca_no, orsh_dt)
                 VALUES ('candyorder'|| order_sheet_seq.nextval, 'candyprod002', 'yedam002', TO_DATE('20230405', 'yyyy/MM/dd'));
INSERT INTO order_sheet (orsh_no, CPR_CD, ca_no, orsh_dt, orsh_pr)
                 VALUES ('candyorder'|| order_sheet_seq.nextval, 'candyprod003', 'yedam003', TO_DATE('20230405', 'yyyy/MM/dd'), '생산중');
INSERT INTO order_sheet (orsh_no, CPR_CD, ca_no, orsh_dt, orsh_pr)
                 VALUES ('candyorder'|| order_sheet_seq.nextval, 'candyprod004', 'yedam004', TO_DATE('20230405', 'yyyy/MM/dd'), '출고완료');
INSERT INTO order_sheet (orsh_no, CPR_CD, ca_no, orsh_dt, orsh_pr)
                 VALUES ('candyorder'|| order_sheet_seq.nextval, 'candyprod005', 'yedam005', TO_DATE('20230405', 'yyyy/MM/dd'), '생산완료');

SELECT * FROM order_sheet;

-- 주문서 디테일 order_sheet_detail
SELECT * FROM order_sheet_detail;
CREATE SEQUENCE order_sheet_detail_seq;
DROP SEQUENCE oder_dtail_seq;
DELETE FROM order_sheet_detail;

INSERT INTO order_sheet_detail
                        VALUES ('orderdetail'||order_sheet_detail_seq.NEXTVAL , 500, '20230323', 'banana001', 'candyorder3');
INSERT INTO order_sheet_detail
                        VALUES ('orderdetail'||order_sheet_detail_seq.NEXTVAL , 300, '20220707', 'banana001', 'candyorder3');
INSERT INTO order_sheet_detail
                        VALUES ('orderdetail'||order_sheet_detail_seq.NEXTVAL , 100, '20230101', 'banana001', 'candyorder3');
INSERT INTO order_sheet_detail
                        VALUES ('orderdetail'||order_sheet_detail_seq.NEXTVAL , 50, '20230217', 'banana001', 'candyorder3');
INSERT INTO order_sheet_detail
                        VALUES ('orderdetail'||order_sheet_detail_seq.NEXTVAL , 700, '20221111', 'banana001', 'candyorder3');

-- 제품관리 CM_PRODUCT_MNG
INSERT INTO CM_PRODUCT_MNG
                    VALUES( 'choco001', '초코맛캔디', 'kg', 'kg', sysdate, sysdate, '제품유형');

SELECT * FROM CM_PRODUCT_MNG;
COMMIT;