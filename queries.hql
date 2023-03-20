create database if not exists db1;

show databases;

desc database db1;

desc database extended db1;

create database if not exists db2 comment 'Deepak created this db';

desc database db2;

desc database extended db2;

create database if not exists db3 comment 'Another database with properties'
with dbproperties ('createdOn'='2023-03-20','createdBy'='Deepak');

desc database db3;

desc database extended db3;

create database if not exists db4 comment 'Another database with properties'
with dbproperties ('createdOn'='2023-03-20','createdBy'="'Deepak'");


desc database extended db4;

create database if not exists db5 location '/user/deepak/databases/db5';

use db4;
create table if not exists table1 (
    col1 string,
    col2 array<string>,
    col3 string,
    col4 int
)
row format delimited
fields terminated by ','
collection items terminated by ':'
lines terminated by '\n'
stored as textfile;

show tables;

desc table1;

desc extended table1;

create table if not exists table2 (
    col1 string,
    col2 array<string>,
    col3 string,
    col4 int
);

create table if not exists table3 (
    col1 string,
    col2 array<string>,
    col3 string,
    col4 int
)
row format delimited
fields terminated by ','
collection items terminated by ':'
lines terminated by '\n'
stored as textfile
location '/user/deepak/table3';


load data local inpath '/config/workspace/table1.txt' into table table1;

use db1;
create table if not exists employees(
    col1 int,
    col2 string,
    col3 string,
    col4 int,
    col5 int,
    col6 int,
    col7 string
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile;

load data local inpath '/config/workspace/employees' into table employees;


create table if not exists dev_tab (col1 int, col2 string, col3 string) stored as textfile;

create table if not exists mgr_tab (col1 int, col2 string, col3 string) stored as textfile;

--- Multi Insert
from employees 
insert into dev_tab select col1, col2, col3 where col3 = 'Developer'
insert into mgr_tab select col1, col2, col3 where col3 = 'Mgr';


create table if not exists tab(
    col1 int,
    col2 string,
    col3 string
)
stored as textfile;

insert into tab select col1,col2,col3 from employees;

-- schema alter

alter table tab add columns (col4 string, col5 int); -- for adding columns
alter table tab change col2 new_col2 string; -- rename column
alter table tab rename to tab1; -- rename table
alter table tab1 replace columns (id int, name string);


create table table5 (
    col1 string,
    col2 int
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile;

load data local inpath '/config/workspace/order' into table table5;


set mapreduce.job.reduces=2;

select * from table5 order by col2;
select * from table5 sort by col2;