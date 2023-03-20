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