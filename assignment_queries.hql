create database if not exists assignment;

use assignment;

create table if not exists orders(
    cust_id string,
    cust_name string,
    order_date date,
    ship_date date,
    courier string,
    received_dt date,
    returned string,
    returned_date date,
    reason_of_return string
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile;

load data local inpath '/config/workspace/assignment_table.txt' into table orders;