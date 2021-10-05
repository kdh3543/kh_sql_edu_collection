

create table contact(
    id number constraint id_pk primary key,--�ĺ���
    name varchar(20) constraint name_nn not null, -- varchar, char �� �� ��� ����
    contact varchar(20) constraint contact_nn unique not null,
    gender varchar(10) check (gender in ('��','��')) not null
    -- �÷���, �ڷ���, �������� ������ ����
);

drop table contact;

-- DML : insert
insert into contact values(1002, 'Jack','01012352423','��'); 
-- column ��ü�� ���� ���� �ְڴٴ� �ǹ�
insert into contact values(1001, 'tom','010423521','��'); 
insert into contact (id, name) values(1001,'Mike'); 
-- column���� ���������� ���� �ְڴ�

select * from contact;
desc contact;

select table_name from user_tables;
select * from user_constraints
where table_name = 'CONTACT'; -- ����ڰ� ���� ���� ���ǵ�


-- Foreign Key
create table product(
    pid varchar(20) primary key,
    pname varchar(100) not null,
    price number default 0 not null
);

drop table product;
insert into product values('p1001','LG-TV',1000000);
insert into product values('p1002','ipad',600000);
select * from product;
delete from product where pid='p1001';
delete from product where pname = 'ipad';
create table purchase_details(
    id number primary key,
    pid references product(pid),
    pdate date default sysdate not null
);

drop table purchase_details;

insert into purchase_details values(1001, 'p1001', default);
insert into purchase_details values(1002, 'p1002', default);

select * from purchase_details;


create table member (
    id varchar(20) primary key,
    pw varchar(20) not null,
    name varchar(10) not null
);

drop table member;
insert into member values('jackid', '1234','jack');
insert into member values('tomid', '4321','tom');
select * from member;

delete from member where id='jackid';

create table board(
    id number not null,
    message varchar(20) not null,
    writer references member(id) on delete set null
);

insert into board values(1001, 'HelloTom', 'jackid');
insert into board values(1002, 'ByeJack', 'tomid');
select * from board;
drop table board;

update contact set gender = '��' where id = 1001;
update contact set name = 'tom', contact = '01012344321' where id = 1001;
select * from contact;


create table khacademy(
    no number primary key,
    id varchar(20) unique,
    pass varchar(20) not null,
    name varchar(20) not null,
    nickname varchar(20) unique,
    gender char(1),
    tel varchar(20) default '010-0000-0000',
    address varchar(90)
);

select column_name, data_type, nullable
    data_default, column_id
from all_tab_columns where table_name = 'CONTACT';

desc khacademy;



