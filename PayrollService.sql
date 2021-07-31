--------------UC1--------------
create database payroll_service;
use payroll_service;
--------------UC2---------------
create table employee_payroll
(
id int identity(1,1) primary key,
name varchar(200) not null,
salary float,
startDate date
);
--------------UC3---------------
insert into employee_payroll values('Harini',24995,'2000-11-13'),('Arjun',88838,'2002-12-27')
insert into employee_payroll (name,startDate,salary) values('Kundana' ,'2003-03-22',34563)
--------------UC4---------------
select * from employee_payroll;
--------------UC5---------------
insert into employee_payroll values('Bill',38383,'2018-01-01'),('Mark',56544,'2020-08-09')
select salary from employee_payroll where name='Bill'
select * from employee_payroll where startDate between CAST('2018-01-01' As date) and getdate()