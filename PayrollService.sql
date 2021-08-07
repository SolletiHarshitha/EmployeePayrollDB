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
--------------UC6---------------
alter table employee_payroll add gender char(1);
update employee_payroll  set gender ='M';
update employee_payroll set gender='F' where name='Harini' or name='Kundana';
--------------UC7---------------
select gender,SUM(salary) as totalSalary from employee_payroll group by gender;
select gender,AVG(salary) as averageSalary from employee_payroll group by gender;
select gender,MIN(salary) as totalSalary from employee_payroll group by gender;
select gender,MAX(salary) as totalSalary from employee_payroll group by gender;
select gender,COUNT(salary) as countOfPeople from employee_payroll group by gender;
--------------UC8---------------
alter table employee_payroll add phonenumber bigint;
alter table employee_payroll add address varchar(150) default 'bangalore';
alter table employee_payroll add department varchar(150) not null default 'HR';

update employee_payroll set phonenumber=8989343478,address='Chennai',department='Sales and Marketing' where name='Kundana';
update employee_payroll set phonenumber=7833829848,address='Chennai',department='HR' where name='Bill';
update employee_payroll set phonenumber=8948373829,address='Bangalore',department='HR' where name='Mark';
update employee_payroll set phonenumber=6748399848,address='Bangalore',department='Sales and Marketing' where name='Arjun';
update employee_payroll set phonenumber=9494943537,address='Mumbai',department='HR' where name='Harini';
--------------UC9---------------
Exec sp_rename 'employee_payroll.salary','basic_pay','COLUMN'
alter table employee_payroll  add taxable_pay float,deductions float,net_pay float,incometax float

update employee_payroll set taxable_pay=1000,deductions=1000,net_pay=20000,incometax=200;
--------------UC10---------------
insert into employee_payroll values('Terissa',89343,'2021-08-09','F',7878787878,'Mumbai','Sales and Marketing',1000,1000,20000,200)
select * from employee_payroll where name='Terissa';
--------------UC11---------------
create table employee
(
EmployeeId int identity(1,1) not null,
Name varchar(200) not null,
Gender char(1) not null,
PhoneNumber bigint,
Address varchar(150) not null
)
Insert into employee values
('Harini','F',9494943537,'Mumbai'),('Arjun','M',6748399848,'Bangalore'),
('Kundana','F',8989343478,'Chennai'),('Bill','M',7833829848,'Chennai'),
('Mark','M',8948373829,'Bangalore'),('Terissa','F',7878787878,'Mumbai');

create table payroll_details
(
Id int not null,
StartDate date not null,
Basic_pay float not null,
Deductions float,
Taxable_pay float,
Net_pay float not null,
Incometax float ,
);
Insert into payroll_details values
(1,'2000-11-13',24995,1000,1000,20000,200),(2,'2002-12-27',88838,1000,1000,20000,200),
(3,'2003-03-02',34563,1000,1000,20000,200),(4,'2018-01-01',38383,1000,1000,20000,200),
(5,'2020-08-09',56544,1000,1000,20000,200),(6,'2021-08-09',3000000,1000,1000,20000,200);

create table department
(
Id int identity(1,1) primary key,
Department varchar(150) not null
);
Insert into department values
('HR'),('Sales and Marketing');

create table employee_department
(
EmployeeId int,
Department varchar(150) not null,
);
Insert into employee_department values
(1,'HR'),(2,'Sales and Marketing'),(3,'Sales and Marketing'),(4,'HR'),(5,'HR'),(6,'Sales and Marketing');
--------------UC11---------------
------------Retrieve All Tables-------------
select * from employee_payroll;
select * from employee;
select * from payroll_details;
select * from employee_department;

--------------Aggregate Functions------------
---Sum of Basic pay by gender---
select emp.Gender,SUM(payroll.Basic_pay) AS TotalPay from payroll_details payroll
inner join employee emp on payroll.Id=emp.EmployeeId group by Gender
---Average of Basic pay by gender---
select emp.Gender,AVG(payroll.Basic_pay) AS AveragePay from payroll_details payroll
inner join employee emp on payroll.Id=emp.EmployeeId group by Gender
---Count of employees by gender---
select Gender,COUNT(Name) AS TotalCount from employee group by Gender
---Minimum salary by gender--
select Gender,MIN(payroll.Basic_pay) AS MinimumPay from payroll_details payroll
inner join employee emp on payroll.Id=emp.EmployeeId group by Gender
---Maximum salary by gender--
select Gender,MAX(payroll.Basic_pay) AS MaximumPay from payroll_details payroll
inner join employee emp on payroll.Id=emp.EmployeeId group by Gender