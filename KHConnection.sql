
select table_name from user_tables;
select * from employee;

desc employee;

select * from employee where hire_date>'90/01/01' and hire_date<'00/01/01';
select * from employee where hire_date between '90/01/01' and '00/01/01';
select * from employee where bonus is null;

select * from employee where emp_id=200 or emp_id=201;
select * from employee where emp_id not in (200,201,202,203);

-- like + % = 아무 글자나 0글자 이상(유 한글자도 검색 됨)
select * from employee where emp_name like '유%';
select * from employee where emp_name like '%하%';
select * from employee where emp_name like '%진';
select * from employee where emp_name like '유_';

select * from employee where emp_name like '_유';

select * from employee;
select * from employee where email like '___#_%' ESCAPE'#';

select emp_name from employee where emp_name like '%연';
select emp_name, phone from employee where phone not like '010%';
select * from employee where email like '%s%' and dept_code in('D9','D6') 
and hire_date between '90/01/01' and '00/12/01' and salary>=2700000;

-- 부서배치가 되지 않았지만 보너스를 지급받는 직원의 이름 및 사번, 보너스, 부서를 출력하세요
select emp_name, emp_id, bonus, dept_code from employee
where dept_code is null and bonus is not null;

-- 연산자 우선순위 and > or 같은범위의 연산자는 서로 묶어줘야 함
select emp_name, salary, job_code from employee
where (job_code='J7' or job_code='J2') and salary > 2000000;

-- order by
select * from employee order by salary asc;
select * from employee order by hire_date desc;
select * from employee order by 2;

select * from employee order by dept_code,job_code desc,salary;

-- nvl(); = 메서드에 값이 전달 되었을때, 전달된 값이 null이면 우리가 지정한 값으로 반환되고,
-- null이 아니면 전달된 값 그대로 반환된다.
select emp_name, nvl(dept_code,'인턴')dept_code from employee;

--1번문제
select emp_name, emp_no, hire_date, salary from employee
where floor((sysdate-hire_date)/365) between 5 and 10;
--2번문제
select * from employee;
select emp_name, dept_code from employee where ent_yn = 'Y';
--3번문제
select * from employee where floor((sysdate-hire_date)/365) >=10 
order by emp_name,salary,floor((sysdate-hire_date)/365);
--4번문제
select emp_name, emp_no, email, phone, salary from employee
where (hire_date between '99/01/01' and '10/01/01') and salary<=2000000;
--5번문제
select emp_name,emp_no,salary,nvl(dept_code,'없음')dept_code from employee
where (salary between 2000000 and 3000000) and (emp_no like '___4%' and emp_no like'%-2%')
order by emp_no desc;
--6번문제
select emp_name, (floor((sysdate-hire_date)/1000)*salary*0.1)plusbonus from employee 
where bonus is null order by emp_name;


-- --------------------------------------------------------------------------------

-- 함수 (function)

select length(1234) from dual;
select emp_id,length(email) from employee;

select instr('Hello World Hi High','H', 2, 3)H의위치 from dual;

select * from employee;
select instr(email,'@',1,1)위치값 from employee;

-- Substr
select Substr('A wise man will make more opportunities', 3, 4)
from dual;
select Substr('A wise man will make more opportunities', 3)
from dual;

select distinct Substr(emp_name,1,1) from employee order by 1;

select emp_id, emp_name, Substr(emp_no,1,8)||'******' emp_no, salary*12 from employee
where emp_no like '%-1%';

select replace('Oracle is not fun','not','very') from dual;

select replace(email,'kh.or.kr','iei.or.kr'), emp_name from employee;

-----------------------------------------------------------------------------

-- round
select round(126.456,-1) from dual;

select floor(123.654) from dual;

select trunc(123.456,2) from dual;

-- ceil
select ceil(123.456) from dual;

select abs(-1) from dual;

select emp_name, months_between(sysdate,hire_date) from employee;

select add_months(sysdate,1) from dual;

select next_day(sysdate,'') from dual;
select next_day(hire_date,'일요일') from employee;

select last_day(sysdate) from dual;

select last_day(add_months(sysdate,1)) from dual;

select extract(year from sysdate) from dual;

select emp_name, extract(year from hire_date)||'년 '
||extract(month from hire_date)||'월 ' 
||extract(day from hire_date)||'일' 입사일, 
ceil((sysdate-hire_date)/365) 년차 from employee
order by 2;


select to_char(sysdate,'YYYY-MM-DD' ) from dual;
select to_char(sysdate,'YYYY/MM/DD') from dual;
select to_char(sysdate,'YYYY"년"/MM"월"/DD"일" HH:MI:SS') from dual;

select to_char(last_day(sysdate),'yyyy/mm/dd(day)') from dual;

select to_char(add_months(last_day(sysdate),6),'day') from dual;

select emp_name, to_char(salary,'L999,999,999') from employee;

select to_date(20200905, 'yyyymmdd') from dual;

select to_char(to_date(20301225),'day') from dual;

select to_Number('10') + 5 from dual;

select emp_name, decode(Substr(emp_no,8,1),1,'남',2,'여') from employee;

select emp_name, case 
when substr(emp_no,8,1) = 1 then '남' else '없음' end from employee;

select emp_name, emp_no from employee;

select emp_name, case when substr(emp_no,1,2)>=65 then '60년대생 후반'
when substr(emp_no,1,2)<65 then '60년대생 초반' end
from employee where emp_no like '6%';

select emp_name, sum(salary) from employee;

select sum(salary) from employee where substr(emp_no,8,1)=2;

select emp_name from employee where substr(emp_no,8,1)=2;

select avg(salary) from employee where substr(emp_no,8,1)=2;

select count(emp_name) from employee;

select min(salary), max(salary) from employee;

select min(salary) from employee;

select count(*) from employee where substr(emp_no,8,1) = 1;

select max(salary) from employee where dept_code='D5';

select * from employee where dept_code = 'D5';

--------------------------------------------------------
select * from employee;


-- 1. 직원명과 이메일, 이메일 길이를 출력하세요.
select emp_name, email, length(email) from employee;

-- 2. 직원의 이름과 이메일 주소 중 아이디 부분만 출력하세요.
select emp_name, substr(email,1,instr(email,'@',1,1)-1) from employee;

-- 3. 60년생의 직원명과 년생, 보너스 율을 출력하세요.
select emp_id 직원명, substr(emp_no,1,2)||'년생' 년생 ,nvl(bonus*100,'0')||'%' 보너스 from employee where emp_no like '6%';

-- 4. '010' 핸드폰 번호를 쓰지 않는 사람의 수를 출력하세요 (뒤에 단위는 명을 붙일것)
select count(emp_name) from employee where phone not like '010%';

-- 5. 직원명과 입사년월을 출력하세요
select emp_name 직원명, to_char(hire_date,'yyyy"년"mm"월"') 입사년월 from employee;

-- 6. 직원명과 주민번호를 조회하세요.
select emp_name 직원명, substr(emp_no,1,8)||'******' 주민번호 from employee;

-- 7. 직원명, 직급코드, 연봉(원) 조회
select emp_name, job_code, to_char(salary*12*(1+nvl(bonus,'0')),'L999,999,999') 연봉 from employee;

-- 8. 부서코드가 D5, D9인 직원들 중에서 2004년도에 입사한 직원의 수 조회함.
-- (사번, 사원명, 부서코드, 입사일)
select emp_id, emp_name, dept_code, hire_date from employee
where (dept_code = 'D5' or dept_code = 'D9') and hire_date like '04%';

-- 9. 직원명, 입사일, 오늘까지의 근무일수 조회 
-- * 주말도 포함 , 소수점 아래는 버림
select emp_name, hire_date, floor(sysdate-hire_date) 근무일수 from employee;

-- 10. 모든 직원의 나이 중 가장 많은 나이와 가장 적은 나이를 출력 하세요. (나이만 출력)
select max(substr(sysdate,1,2)-substr(emp_no,1,2)+101) 가장많은나이,
min(substr(sysdate,1,2)-substr(emp_no,1,2)+101) 가장적은나이 from employee;

-- 11. 회사에서 야근을 해야 되는 부서를 발표하여야 한다.
 --부서코드가 D5,D6,D9  야근, 그외는 야근없음 으로 출력되도록 하세요. 
 --출력 값은 이름,부서코드,야근유무 (부서코드 기준 오름차순 정렬함.)
 --  (부서코드가 null인 사람도 야근없음 임)
select emp_name, dept_code, case when dept_code in ('D5','D6','D9') then '야근'
else '야근없음' end 야근유무 from employee order by dept_code;

select dept_code, sum(salary) from employee group by dept_code; -- 부서별 급여 합계
select emp_name, salary from employee; -- 직원별 급여목록
select dept_code, max(salary) from employee group by dept_code;

select dept_code, to_char(sum(salary), 'L999,999,999')"부서별 급여합계",
to_char(floor(avg(salary)),'L999,999,999')"부서별 급여평균",
count(*) 사람수 -- 부서별 사람 수
,min(salary), max(salary)
from employee group by dept_code order by 1;

select count(*) from employee where bonus is null 
group by dept_code order by 1;

select count(bonus) from employee group by dept_code;

select job_code, count(*), to_char(floor(avg(salary)),'L999,999,999')평균급여
from employee where job_code not like 'J1' 
group by job_code;

select decode(substr(emp_no,8,1),1,'남',2,'여')성별,count(*)성별인원수 from employee group by 
substr(emp_no,8,1), emp_no, 8, 1, decode(substr(emp_no,8,1),1,'남',2,'여') ;

select substr(hire_date,1,2)||'년' 년도, count(*)입사년도 from employee 
where job_code!='J1' 
group by substr(hire_date,1,2)||'년' order by 1;

select 
    case 
        when substr(emp_no,1,2) between 60 and 69 then '60년대생'
        when substr(emp_no,1,2) between 70 and 79 then '70년대생'
        when substr(emp_no,1,2) between 80 and 89 then '80년대생'
        else '없음' end 연령대, 
    count(*)인원수 
from 
    employee 
group by 
    case 
        when substr(emp_no,1,2) between 60 and 69 then '60년대생'
        when substr(emp_no,1,2) between 70 and 79 then '70년대생'
        when substr(emp_no,1,2) between 80 and 89 then '80년대생'
        else '없음' 
    end 
order by 1;

select dept_code, job_code, sum(salary) from employee 
group by dept_code, job_code order by 1; -- 부서 내 직급 별 급여 합계

select job_code 직급, decode(substr(emp_no,8,1),1,'남',2,'여') 성별, count(*) 인원수
from employee group by job_code, decode(substr(emp_no,8,1),1,'남',2,'여')
order by 1;

select dept_code 직급, decode(substr(emp_no,8,1),1,'남',2,'여') 성별, count(*) 인원수
from employee group by dept_code, decode(substr(emp_no,8,1),1,'남',2,'여')
order by 1;

select dept_code, floor(avg(salary)) from employee
where salary<2500 group by dept_code;

select dept_code, floor(avg(salary)) from employee
group by dept_code having avg(salary)<2500000;

select * from employee; -- Cross Join
select * from department;

select * from employee, department where dept_code=dept_id;
select emp_name, job_name from employee e, job j where e.job_code = j.job_code;
select emp_name, job_name from employee inner join job using(job_code);

select emp_name, dept_title from employee ,demplartment 
where dept_code=dept_id; -- 오라클 문법
select emp_name, dept_title from employee inner join department 
on (employee.dept_code = department.dept_id); -- ANSI 표준문법

select emp_name, dept_title from employee left outer join department
on (employee.dept_code = department.dept_id); -- ANSI 문법
select emp_name, dept_title from employee,department 
where employee.dept_code = department.dept_id(+); -- 오라클 문법

select emp_id, emp_name,manager_id from employee;

select e1.emp_id, e1.emp_name "직원명", e2.emp_name "매니저 이름" 
from employee e1, employee e2 where e1.manager_id = e2.emp_id; -- 오라클 문법

select e1.emp_id, e1.emp_name "직원이름", e2.emp_name "상사이름" 
from employee e1 inner join employee e2 on(e1.manager_id = e2.emp_id); --ANSI

select 
    e.emp_name, d.dept_title, d.location_id, 
    l.national_code, n.national_name
from employee e join department d
    on (e.dept_code = d.dept_id)
    join location l
    on (d.location_id = l.Local_code)
    join national n on (l.national_code=n.national_code);

select
    e.emp_name 이름, d.dept_title 부서명, j.job_name 직책명
from employee e
    join department d on(e.dept_code=d.dept_id)
    join job j on(e.job_code = j.job_code) order by 2;

select
    d.dept_title, sum(e.salary)
from employee e
    join department d on (e.dept_code=d.dept_id) group by dept_title;

--1번문제
select to_date(20201215,'yyyymmdd')날짜,
to_char(to_date(20201215,'yyyymmdd'),'day') 요일 from dual;

--2번문제
select e.emp_name, e.emp_no, d.dept_title, j.job_name 
from employee e join job j on(e.job_code = j.job_code)
join department d on(e.dept_code = d.dept_id)
where (substr(e.emp_no,1,2) between 70 and 79) and substr(e.emp_no,8,1)=2
and substr(e.emp_name,1,1) = '전';

--3번문제
select e.emp_id, e.emp_name, d.dept_title 
from employee e join department d on (e.dept_code = d.dept_id)
where e.emp_name like '%형%';

--4번문제
select emp_name, job_name, dept_code, dept_title 
from employee e join job j on(e.job_code = j.job_code)
join department d on(e.dept_code = d.dept_id)
where substr(d.dept_title,1,4) = '해외영업' order by 3;

--5번문제
select e.emp_name, e.bonus, d.dept_title, l.local_name
from  employee e join department d on(e.dept_code = d.dept_id)
join location l on(d.location_id=l.local_code)
where bonus is not null order by 2;

--6번문제
select e.emp_name, j.job_name, d.dept_title, l.local_name
from employee e join job j on(e.job_code = j.job_code)
join department d on(e.dept_code = d.dept_id)
join location l on(d.location_id = l.local_code)
where e.dept_code = 'D2';

--7번문제
select e.emp_name, d.dept_title, l.local_name, n.national_name
from employee e join department d on(e.dept_code = d.dept_id)
join location l on(d.location_id = l.local_code)
join national n on(l.national_code = n.national_code)
where n.national_name in('한국','일본') order by 4;

--8번문제
select e1.emp_name, d.dept_title, e2.emp_name from employee e1
join employee e2 on(e1.dept_code = e2.dept_code)
join department d on(e1.dept_code = d.dept_id)
where e1.emp_name!=e2.emp_name order by 1;

--9번문제
select e.emp_name, j.job_name, e.salary from employee e
join job j on(e.job_code = j.job_code)
where j.job_name in('차장', '사원') and bonus is null
order by 2;

--10번문제
select decode(ent_yn,'Y','퇴사자','N','재직자')"재직/퇴사", count(*) 인원수 
from employee group by decode(ent_yn,'Y','퇴사자','N','재직자');

drop table temp1;
create table temp1(
  str varchar(10)
);
delete from temp1 where str='B';
insert into temp1 values('A');
insert into temp1 values('B');
select * from temp1;


create table temp2(
 str varchar(20)
 );
insert into temp2 values('B');
insert into temp2 values('C');
select * from temp2;

select * from temp1 union all select * from temp2;
select * from temp1 union select * from temp2;
select * from temp1 intersect select * from temp2;
select * from temp1 minus select * from temp2;
select * from temp2 minus select * from temp1;

select emp_id, emp_name from employee
union
select dept_id, dept_title from department;

select emp_name, manager_id from employee where emp_name = '전지연';
select emp_id, emp_name from employee where emp_id=214;

select emp_name from employee 
where emp_id = (select manager_id from employee where emp_name = '전지연');

select emp_id, emp_name, job_code, salary 
from employee where salary > (select avg(salary) from employee);

select emp_id, emp_name, salary from employee
where salary = (select salary from employee where emp_name = '윤은해')
and emp_name != '윤은해';

select emp_name, salary from employee
where salary = (select min(salary) from employee);

select j.job_name, e.emp_name, e.salary from employee e join
job j on(e.job_code=j.job_code)
where salary in((select min(salary) from employee),(select max(salary) from employee));

select d.dept_title, e.emp_id, e.emp_name, e.salary from employee e
join department d on (e.dept_code = d.dept_id)
where salary > (select avg(salary) from employee where dept_code = 'D5')
and dept_code in('D1','D2');

select emp_name, dept_code, salary from employee 
where dept_code in 
(select dept_code from employee where emp_name in('송종기','전지연'));

select job_name, emp_name from employee  
join job using (job_code)
where sal_level in (select sal_level from employee 
where emp_name in('차태연','전지연'));

select emp_name,salary from employee where job_code='J3';

select emp_name, salary, dept_code from employee
where salary < any(select salary from employee where dept_code in('D1','D5'));

select emp_name, salary, dept_title from employee e join department d
on (e.dept_code = d.dept_id)
where salary >= any(select avg(salary) from employee group by dept_code);

select dept_code, job_code, emp_name from employee 
    where (dept_code,job_code) = (select dept_code, job_code
    from employee where emp_name='이태림');

select job_code, emp_name, salary 
from employee where (job_code, salary) in (select job_code, min(salary) 
from employee group by job_code);

select dept_code, job_code, emp_name from employee where
(dept_code, job_code) = (select dept_code, job_code from employee
where emp_name = '이태림');

select * from national;
select * from job;
select * from department;
select * from location;
select * from employee order by 6;
select table_name from user_tables;
select * from sal_grade;

desc employee;

--1
select emp_name, dept_code, salary from employee e
join department d on (e.dept_code = d.dept_id)
where d.dept_title = '기술지원부';

--2
select emp_name, dept_code, salary from employee 
where (salary+(salary*nvl(bonus,0)))*12 = 
(select max((salary+(salary*nvl(bonus,0)))*12) from employee e
join department d on (e.dept_code = d.dept_id)
where dept_title = '기술지원부');

--3
select e1.emp_id, e1.emp_name, e2.emp_name 매니저이름, trunc(e1.salary,-4) 
from employee e1
join employee e2 on (e1.dept_code = e2.dept_code)
where e1.manager_id is not null and e1.emp_name != e2.emp_name
and e1.salary > (select avg(salary) from employee);

--4
select emp_name, job_code, salary, sal_level from employee
where (job_code, sal_level) in (select job_code, min(sal_level) 
from employee group by job_code);

--5
select d.dept_title, floor(avg(e.salary)) from employee e join department d on
(e.dept_code = d.dept_id) group by d.dept_title 
having floor(avg(e.salary)) >= 2200000;

--6
select emp_name, job_code, dept_code, (salary+(salary*nvl(bonus,0)))*12 연봉
from employee e1 where (salary+(salary*nvl(bonus,0)))*12 
< (select avg((salary+(salary*nvl(bonus,0)))*12) from employee e2
where e1.job_code = e2.job_code ) and substr(emp_no,8,1) = 2 order by 1;


select emp_name, job_code, salary from employee e 
where salary >= (select avg(salary) from employee e2 where e2.job_code = e.job_code)
order by 2;

select job_code, avg(salary) from employee group by job_code order by 1;