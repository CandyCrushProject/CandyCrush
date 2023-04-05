CREATE TABLE T_ROLE (
     ID           number primary key,
     ROLE_NAME  varchar2(100) not null,
     DESCRIPTION varchar2(100)
 );

 CREATE TABLE T_USER (
  ID           number primary key,
  LOGIN_ID    varchar2(20)   not null,
  PASSWORD  varchar2(200)  not null,
  FULL_NAME  varchar2(100)  not null,
  DEPT_NAME  varchar2(100)  not null
);
 
 CREATE TABLE T_USER_ROLE (
  ROLE_ID number,
  USER_ID number,
  foreign key (role_id) references t_role(id),
  foreign key (user_id) references t_user(id),
  primary key(role_id, user_id) 
);

--///데이터 입력
 insert into t_user values( 1,'user', '1234','사용자','인사');
 insert into t_user values( 2,'admin', '1234','관리자','기획');

 insert into t_role values(1, 'ROLE_USER','일반사용자');
 insert into t_role values(2, 'ROLE_ADMIN','시스템관리자');

 insert into t_user_role values(1, 1);
 insert into t_user_role values(2, 2);
 
 commit;
 
 update t_user
 set password='$2a$10$NS3cGqs9D395GLHeuaMlj.UrflZhDcbNKzAcqCSRGPSjxrpu3M1hm';
 select * from t_user;
 commit;