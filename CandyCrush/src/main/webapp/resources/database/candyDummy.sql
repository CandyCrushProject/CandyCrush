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


                 