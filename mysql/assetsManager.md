drop database if exists assetsManagter;

create database assetsManager default character set utf8mb4;

use assets Manager;

create table categorys(
    id int auto_increment primary key,
    category varchar(50) not null,
);


create table department

create employees(
    id int auto_increment primary key comment '表主键',
    first_name varchar(20) comment '名字',
    last_name varchar(20) comment '姓',
    department_id int ,
    location_id int,
    phone varchar(11),
    manager_id int
    hiredate datetime not null default '2019-01-01 00:00:00'
)

