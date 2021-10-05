
create table cafe_menu(
    id number,
    name varchar(30),
    price number
    );
    
-- describe
desc cafe_menu;

-- 데이터를 저장하는 쿼리
insert into cafe_menu values(1001,'Americano',2000);

-- 저장된 데이터를 확인하는 쿼리
select * from cafe_menu;

select table_name from user_tables;

select * from employee;
select emp_id, emp_name, emp_no from employee;
select * from department;
select * from job;
select * from national;

--where
select * from employee where salary>=3000000;

select 
emp_id, 
emp_name, 
salary, 
phone 
from employee where salary<=2000000;

select * from employee where emp_id=200 or emp_id=201;
select * from employee where emp_id=200 and emp_id=201;

--연습문제
select job_name from job;

select * from department;

select emp_name, email, phone, hire_date from employee;

select emp_name, sal_level from employee where salary<=2500000;

select emp_name, phone from employee where salary>=3500000 and job_code='J3';

select emp_id, emp_name, salary from employee where 
salary>=3000000 and salary<=4000000;

select emp_id, emp_name, salary from employee where
salary between 3000000 and 4000000;

select emp_id 사번, emp_name 직원명, emp_no
, salary*12 연봉 from employee;

select emp_id 사번, emp_name 직원명, emp_no
, salary*12||'원'연봉 from employee;

select employee.* ,sysdate 현재날짜 from employee;
        -- 3인칭 시점
        
select sysdate from dual;

select sysdate+5 from dual;
select (sysdate+5)-sysdate from dual;

desc employee;

select emp_name, floor(sysdate-hire_date)  근무일수 from employee;

select emp_name, salary, floor((sysdate-hire_date)/365)||'년' 근속년수 from employee where  floor((sysdate-hire_date)/365)>=20; 

