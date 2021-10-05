
select table_name from user_tables;
select * from employee;

desc employee;

select * from employee where hire_date>'90/01/01' and hire_date<'00/01/01';
select * from employee where hire_date between '90/01/01' and '00/01/01';
select * from employee where bonus is null;

select * from employee where emp_id=200 or emp_id=201;
select * from employee where emp_id not in (200,201,202,203);

-- like + % = �ƹ� ���ڳ� 0���� �̻�(�� �ѱ��ڵ� �˻� ��)
select * from employee where emp_name like '��%';
select * from employee where emp_name like '%��%';
select * from employee where emp_name like '%��';
select * from employee where emp_name like '��_';

select * from employee where emp_name like '_��';

select * from employee;
select * from employee where email like '___#_%' ESCAPE'#';

select emp_name from employee where emp_name like '%��';
select emp_name, phone from employee where phone not like '010%';
select * from employee where email like '%s%' and dept_code in('D9','D6') 
and hire_date between '90/01/01' and '00/12/01' and salary>=2700000;

-- �μ���ġ�� ���� �ʾ����� ���ʽ��� ���޹޴� ������ �̸� �� ���, ���ʽ�, �μ��� ����ϼ���
select emp_name, emp_id, bonus, dept_code from employee
where dept_code is null and bonus is not null;

-- ������ �켱���� and > or ���������� �����ڴ� ���� ������� ��
select emp_name, salary, job_code from employee
where (job_code='J7' or job_code='J2') and salary > 2000000;

-- order by
select * from employee order by salary asc;
select * from employee order by hire_date desc;
select * from employee order by 2;

select * from employee order by dept_code,job_code desc,salary;

-- nvl(); = �޼��忡 ���� ���� �Ǿ�����, ���޵� ���� null�̸� �츮�� ������ ������ ��ȯ�ǰ�,
-- null�� �ƴϸ� ���޵� �� �״�� ��ȯ�ȴ�.
select emp_name, nvl(dept_code,'����')dept_code from employee;

--1������
select emp_name, emp_no, hire_date, salary from employee
where floor((sysdate-hire_date)/365) between 5 and 10;
--2������
select * from employee;
select emp_name, dept_code from employee where ent_yn = 'Y';
--3������
select * from employee where floor((sysdate-hire_date)/365) >=10 
order by emp_name,salary,floor((sysdate-hire_date)/365);
--4������
select emp_name, emp_no, email, phone, salary from employee
where (hire_date between '99/01/01' and '10/01/01') and salary<=2000000;
--5������
select emp_name,emp_no,salary,nvl(dept_code,'����')dept_code from employee
where (salary between 2000000 and 3000000) and (emp_no like '___4%' and emp_no like'%-2%')
order by emp_no desc;
--6������
select emp_name, (floor((sysdate-hire_date)/1000)*salary*0.1)plusbonus from employee 
where bonus is null order by emp_name;


-- --------------------------------------------------------------------------------

-- �Լ� (function)

select length(1234) from dual;
select emp_id,length(email) from employee;

select instr('Hello World Hi High','H', 2, 3)H����ġ from dual;

select * from employee;
select instr(email,'@',1,1)��ġ�� from employee;

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
select next_day(hire_date,'�Ͽ���') from employee;

select last_day(sysdate) from dual;

select last_day(add_months(sysdate,1)) from dual;

select extract(year from sysdate) from dual;

select emp_name, extract(year from hire_date)||'�� '
||extract(month from hire_date)||'�� ' 
||extract(day from hire_date)||'��' �Ի���, 
ceil((sysdate-hire_date)/365) ���� from employee
order by 2;


select to_char(sysdate,'YYYY-MM-DD' ) from dual;
select to_char(sysdate,'YYYY/MM/DD') from dual;
select to_char(sysdate,'YYYY"��"/MM"��"/DD"��" HH:MI:SS') from dual;

select to_char(last_day(sysdate),'yyyy/mm/dd(day)') from dual;

select to_char(add_months(last_day(sysdate),6),'day') from dual;

select emp_name, to_char(salary,'L999,999,999') from employee;

select to_date(20200905, 'yyyymmdd') from dual;

select to_char(to_date(20301225),'day') from dual;

select to_Number('10') + 5 from dual;

select emp_name, decode(Substr(emp_no,8,1),1,'��',2,'��') from employee;

select emp_name, case 
when substr(emp_no,8,1) = 1 then '��' else '����' end from employee;

select emp_name, emp_no from employee;

select emp_name, case when substr(emp_no,1,2)>=65 then '60���� �Ĺ�'
when substr(emp_no,1,2)<65 then '60���� �ʹ�' end
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


-- 1. ������� �̸���, �̸��� ���̸� ����ϼ���.
select emp_name, email, length(email) from employee;

-- 2. ������ �̸��� �̸��� �ּ� �� ���̵� �κи� ����ϼ���.
select emp_name, substr(email,1,instr(email,'@',1,1)-1) from employee;

-- 3. 60����� ������� ���, ���ʽ� ���� ����ϼ���.
select emp_id ������, substr(emp_no,1,2)||'���' ��� ,nvl(bonus*100,'0')||'%' ���ʽ� from employee where emp_no like '6%';

-- 4. '010' �ڵ��� ��ȣ�� ���� �ʴ� ����� ���� ����ϼ��� (�ڿ� ������ ���� ���ϰ�)
select count(emp_name) from employee where phone not like '010%';

-- 5. ������� �Ի����� ����ϼ���
select emp_name ������, to_char(hire_date,'yyyy"��"mm"��"') �Ի��� from employee;

-- 6. ������� �ֹι�ȣ�� ��ȸ�ϼ���.
select emp_name ������, substr(emp_no,1,8)||'******' �ֹι�ȣ from employee;

-- 7. ������, �����ڵ�, ����(��) ��ȸ
select emp_name, job_code, to_char(salary*12*(1+nvl(bonus,'0')),'L999,999,999') ���� from employee;

-- 8. �μ��ڵ尡 D5, D9�� ������ �߿��� 2004�⵵�� �Ի��� ������ �� ��ȸ��.
-- (���, �����, �μ��ڵ�, �Ի���)
select emp_id, emp_name, dept_code, hire_date from employee
where (dept_code = 'D5' or dept_code = 'D9') and hire_date like '04%';

-- 9. ������, �Ի���, ���ñ����� �ٹ��ϼ� ��ȸ 
-- * �ָ��� ���� , �Ҽ��� �Ʒ��� ����
select emp_name, hire_date, floor(sysdate-hire_date) �ٹ��ϼ� from employee;

-- 10. ��� ������ ���� �� ���� ���� ���̿� ���� ���� ���̸� ��� �ϼ���. (���̸� ���)
select max(substr(sysdate,1,2)-substr(emp_no,1,2)+101) ���帹������,
min(substr(sysdate,1,2)-substr(emp_no,1,2)+101) ������������ from employee;

-- 11. ȸ�翡�� �߱��� �ؾ� �Ǵ� �μ��� ��ǥ�Ͽ��� �Ѵ�.
 --�μ��ڵ尡 D5,D6,D9  �߱�, �׿ܴ� �߱پ��� ���� ��µǵ��� �ϼ���. 
 --��� ���� �̸�,�μ��ڵ�,�߱����� (�μ��ڵ� ���� �������� ������.)
 --  (�μ��ڵ尡 null�� ����� �߱پ��� ��)
select emp_name, dept_code, case when dept_code in ('D5','D6','D9') then '�߱�'
else '�߱پ���' end �߱����� from employee order by dept_code;

select dept_code, sum(salary) from employee group by dept_code; -- �μ��� �޿� �հ�
select emp_name, salary from employee; -- ������ �޿����
select dept_code, max(salary) from employee group by dept_code;

select dept_code, to_char(sum(salary), 'L999,999,999')"�μ��� �޿��հ�",
to_char(floor(avg(salary)),'L999,999,999')"�μ��� �޿����",
count(*) ����� -- �μ��� ��� ��
,min(salary), max(salary)
from employee group by dept_code order by 1;

select count(*) from employee where bonus is null 
group by dept_code order by 1;

select count(bonus) from employee group by dept_code;

select job_code, count(*), to_char(floor(avg(salary)),'L999,999,999')��ձ޿�
from employee where job_code not like 'J1' 
group by job_code;

select decode(substr(emp_no,8,1),1,'��',2,'��')����,count(*)�����ο��� from employee group by 
substr(emp_no,8,1), emp_no, 8, 1, decode(substr(emp_no,8,1),1,'��',2,'��') ;

select substr(hire_date,1,2)||'��' �⵵, count(*)�Ի�⵵ from employee 
where job_code!='J1' 
group by substr(hire_date,1,2)||'��' order by 1;

select 
    case 
        when substr(emp_no,1,2) between 60 and 69 then '60����'
        when substr(emp_no,1,2) between 70 and 79 then '70����'
        when substr(emp_no,1,2) between 80 and 89 then '80����'
        else '����' end ���ɴ�, 
    count(*)�ο��� 
from 
    employee 
group by 
    case 
        when substr(emp_no,1,2) between 60 and 69 then '60����'
        when substr(emp_no,1,2) between 70 and 79 then '70����'
        when substr(emp_no,1,2) between 80 and 89 then '80����'
        else '����' 
    end 
order by 1;

select dept_code, job_code, sum(salary) from employee 
group by dept_code, job_code order by 1; -- �μ� �� ���� �� �޿� �հ�

select job_code ����, decode(substr(emp_no,8,1),1,'��',2,'��') ����, count(*) �ο���
from employee group by job_code, decode(substr(emp_no,8,1),1,'��',2,'��')
order by 1;

select dept_code ����, decode(substr(emp_no,8,1),1,'��',2,'��') ����, count(*) �ο���
from employee group by dept_code, decode(substr(emp_no,8,1),1,'��',2,'��')
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
where dept_code=dept_id; -- ����Ŭ ����
select emp_name, dept_title from employee inner join department 
on (employee.dept_code = department.dept_id); -- ANSI ǥ�ع���

select emp_name, dept_title from employee left outer join department
on (employee.dept_code = department.dept_id); -- ANSI ����
select emp_name, dept_title from employee,department 
where employee.dept_code = department.dept_id(+); -- ����Ŭ ����

select emp_id, emp_name,manager_id from employee;

select e1.emp_id, e1.emp_name "������", e2.emp_name "�Ŵ��� �̸�" 
from employee e1, employee e2 where e1.manager_id = e2.emp_id; -- ����Ŭ ����

select e1.emp_id, e1.emp_name "�����̸�", e2.emp_name "����̸�" 
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
    e.emp_name �̸�, d.dept_title �μ���, j.job_name ��å��
from employee e
    join department d on(e.dept_code=d.dept_id)
    join job j on(e.job_code = j.job_code) order by 2;

select
    d.dept_title, sum(e.salary)
from employee e
    join department d on (e.dept_code=d.dept_id) group by dept_title;

--1������
select to_date(20201215,'yyyymmdd')��¥,
to_char(to_date(20201215,'yyyymmdd'),'day') ���� from dual;

--2������
select e.emp_name, e.emp_no, d.dept_title, j.job_name 
from employee e join job j on(e.job_code = j.job_code)
join department d on(e.dept_code = d.dept_id)
where (substr(e.emp_no,1,2) between 70 and 79) and substr(e.emp_no,8,1)=2
and substr(e.emp_name,1,1) = '��';

--3������
select e.emp_id, e.emp_name, d.dept_title 
from employee e join department d on (e.dept_code = d.dept_id)
where e.emp_name like '%��%';

--4������
select emp_name, job_name, dept_code, dept_title 
from employee e join job j on(e.job_code = j.job_code)
join department d on(e.dept_code = d.dept_id)
where substr(d.dept_title,1,4) = '�ؿܿ���' order by 3;

--5������
select e.emp_name, e.bonus, d.dept_title, l.local_name
from  employee e join department d on(e.dept_code = d.dept_id)
join location l on(d.location_id=l.local_code)
where bonus is not null order by 2;

--6������
select e.emp_name, j.job_name, d.dept_title, l.local_name
from employee e join job j on(e.job_code = j.job_code)
join department d on(e.dept_code = d.dept_id)
join location l on(d.location_id = l.local_code)
where e.dept_code = 'D2';

--7������
select e.emp_name, d.dept_title, l.local_name, n.national_name
from employee e join department d on(e.dept_code = d.dept_id)
join location l on(d.location_id = l.local_code)
join national n on(l.national_code = n.national_code)
where n.national_name in('�ѱ�','�Ϻ�') order by 4;

--8������
select e1.emp_name, d.dept_title, e2.emp_name from employee e1
join employee e2 on(e1.dept_code = e2.dept_code)
join department d on(e1.dept_code = d.dept_id)
where e1.emp_name!=e2.emp_name order by 1;

--9������
select e.emp_name, j.job_name, e.salary from employee e
join job j on(e.job_code = j.job_code)
where j.job_name in('����', '���') and bonus is null
order by 2;

--10������
select decode(ent_yn,'Y','�����','N','������')"����/���", count(*) �ο��� 
from employee group by decode(ent_yn,'Y','�����','N','������');

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

select emp_name, manager_id from employee where emp_name = '������';
select emp_id, emp_name from employee where emp_id=214;

select emp_name from employee 
where emp_id = (select manager_id from employee where emp_name = '������');

select emp_id, emp_name, job_code, salary 
from employee where salary > (select avg(salary) from employee);

select emp_id, emp_name, salary from employee
where salary = (select salary from employee where emp_name = '������')
and emp_name != '������';

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
(select dept_code from employee where emp_name in('������','������'));

select job_name, emp_name from employee  
join job using (job_code)
where sal_level in (select sal_level from employee 
where emp_name in('���¿�','������'));

select emp_name,salary from employee where job_code='J3';

select emp_name, salary, dept_code from employee
where salary < any(select salary from employee where dept_code in('D1','D5'));

select emp_name, salary, dept_title from employee e join department d
on (e.dept_code = d.dept_id)
where salary >= any(select avg(salary) from employee group by dept_code);

select dept_code, job_code, emp_name from employee 
    where (dept_code,job_code) = (select dept_code, job_code
    from employee where emp_name='���¸�');

select job_code, emp_name, salary 
from employee where (job_code, salary) in (select job_code, min(salary) 
from employee group by job_code);

select dept_code, job_code, emp_name from employee where
(dept_code, job_code) = (select dept_code, job_code from employee
where emp_name = '���¸�');

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
where d.dept_title = '���������';

--2
select emp_name, dept_code, salary from employee 
where (salary+(salary*nvl(bonus,0)))*12 = 
(select max((salary+(salary*nvl(bonus,0)))*12) from employee e
join department d on (e.dept_code = d.dept_id)
where dept_title = '���������');

--3
select e1.emp_id, e1.emp_name, e2.emp_name �Ŵ����̸�, trunc(e1.salary,-4) 
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
select emp_name, job_code, dept_code, (salary+(salary*nvl(bonus,0)))*12 ����
from employee e1 where (salary+(salary*nvl(bonus,0)))*12 
< (select avg((salary+(salary*nvl(bonus,0)))*12) from employee e2
where e1.job_code = e2.job_code ) and substr(emp_no,8,1) = 2 order by 1;


select emp_name, job_code, salary from employee e 
where salary >= (select avg(salary) from employee e2 where e2.job_code = e.job_code)
order by 2;

select job_code, avg(salary) from employee group by job_code order by 1;