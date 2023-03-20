create database if not exists assignment;

use assignment;

create table if not exists orders_stg(
    cust_id string,
    cust_name string,
    order_date string,
    ship_date string,
    courier string,
    received_dt string,
    returned string,
    returned_date string,
    reason_of_return string
)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile
tblproperties ('skip.header.line.count'='1');

load data local inpath '/config/workspace/assignment_table' into table orders_stg;

-- ALTER TABLE orders SET TBLPROPERTIES ("skip.header.line.count"="1");

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
stored as textfile
tblproperties ('skip.header.line.count'='1');


insert into orders select 
cust_id,
cust_name,
from_unixtime(unix_timestamp(order_date,'dd-MM-yyyy'),'yyyy-MM-dd') as order_date,
from_unixtime(unix_timestamp(ship_date,'dd-MM-yyyy'),'yyyy-MM-dd') as ship_date,
courier,
from_unixtime(unix_timestamp(received_dt,'dd-MM-yyyy'),'yyyy-MM-dd') as received_dt,
returned,
from_unixtime(unix_timestamp(returned_date,'dd-MM-yyyy'),'yyyy-MM-dd') as returned_date,
reason_of_return
from orders_stg;