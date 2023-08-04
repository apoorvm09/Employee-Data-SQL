create schema company;
create table employee(
	fname varchar(30),
    minit char(1),
    lname varchar(30),
    ssn char(9),
    bdate date,
    address varchar(50),
    sex char(1),
    salary float(10,2),
    super_ssn char(9),
    dno char(3));
    
insert into employee values
('John','B','Smith','123456789','1965-01-09','731 Fondren, Houston, TX','M',30000,'333445555',5), 
('Franklin','T','Wong','333445555','1955-12-08','638 Voss, Houston, TX','M',40000,'888665555',5), 
('Alicia','J','Zelaya','999887777','1968-01-09','3321 Castle, Spring, TX','F',25000,'987654321',4), 
('Jennifer','S','Wallace','987654321','1941-06-20','291 Berry, Bellaire, TX','F',43000,'888665555',4), 
('Ramesh','K','Narayan','666884444','1962-09-15','975 Fire Oak, Humble, TX','M',38000,'333445555',5), 
('Joyce','A','English','453453453','1972-07-31','5631 Rice, Houston, TX','F',25000,'333445555',5), 
('Ahmad','V','Jabbar','987987987','1969-03-29','980 Dallas, Houston, TX','M',25000,'987654321',4), 
('James','E','Borg','888665555','1937-11-10','450 Stone, Houston, TX','M',55000, NULL,1) ;

create table Department(
	Dname varchar(20),
    Dnumber char(1),
    Mgr_ssn char(9),
    Mgr_start_date date);
    
insert into Department values
('research','5','333445555','1988-05-22'), 
('administration','4','987654321','1995-01-01'), 
('headquaters','1','888665555','1981-06-19') ;

create table dept_locations( 
dnumber int, 
dlocation varchar(20)); 

insert into dept_locations values 
(1, 'Houston'), 
(4, 'Stafford'), 
(5, 'Bellaire'), 
(5, 'Sugarland'), 
(5, 'Houston');

create table works_on( 
essn char(9), 
pno int, 
hours float(4,2));

insert into works_on (essn, pno, hours) values 
('123456789', 1, 32.5), 
('123456789', 2, 7.5), 
('666884444', 3, 40.0), 
('453453453', 1, 20.0), 
('453453453', 2, 20.0), 
('333445555', 2, 10.0), 
('333445555', 3, 10.0), 
('333445555', 10, 10.0), 
('333445555', 20, 10.0), 
('999887777', 30, 30.0), 
('999887777', 10, 10.0), 
('987987987', 10, 35.0), 
('987987987', 30, 5.0), 
('987654321', 30, 20.0), 
('987654321', 20, 15.0), 
('888665555', 20, NULL);

create table project( 
pname varchar(30), 
pnumber int, 
plocation varchar(30), 
dnum int); 

insert into project(pname,pnumber,plocation,dnum) values 
('ProductX', 1, 'Bellaire', 5), 
('ProductY', 2, 'Sugarland', 5), 
('ProductZ', 3, 'Houston', 5), 
('Computerization', 10, 'Stafford', 4), 
('Reorganization', 20, 'Houston', 1), 
('Newbenefits', 30, 'Stafford', 4);

create table dependent( 
essn char(9), 
dependent_name varchar(30), 
sex char(1), 
bdate date, 
relationship varchar(20)); 

insert into dependent(essn,dependent_name,sex,bdate,relationship) values 
('333445555', 'Alice', 'F', '1986-04-05', 'Daughter'), 
('333445555', 'Theodore', 'M', '1983-10-25', 'Son'), 
('333445555', 'Joy', 'F', '1958-05-03', 'Spouse'), 
('987654321', 'Abner', 'M', '1942-02-28', 'Spouse'),
('123456789', 'Michael', 'M', '1988-01-04', 'Son'), 
('123456789', 'Alice', 'F', '1988-12-30', 'Daughter'), 
('123456789', 'Elizabeth', 'F', '1967-05-05', 'Spouse');

#                                                           DDL                                 

# dropping a table manually
create table apoorv(
	name varchar(10));
    
drop table apoorv;

# adding primary key manually
alter table employee
add primary key(ssn);

# alter commands
# 1. changing column name
alter table employee
change salary salaries float(10,2);

# 2. changing datatype
alter table employee
modify salaries float(11,2);

# 3. adding a new column
alter table employee
add practice varchar(10);

# 3. dropping a column
alter table employee
drop practice;

# 4. rename table
alter table employees
rename to employee;

# setting foreign key
alter table employee
add foreign key (dno) references department (Dnumber);

#                                                  DML

# Upadating a row data
update employee
set salaries=35000, dno=3
where ssn=123456789;

#                                                  DQL

# 1. reteive all the data from the employee table
select * from employee;

# 2. reteive first nsame and last name of all employees
select fname,lname from employee;
 
 # note- now when we have fetched the required data we can disrect use the export button to save the required data at a place
 
 # 3. set alias in the above result
 select fname as First_Name ,lname as Sur_Name from employee;

# 4. get details of all employees who get at least 40000 salary.
select * from employee
where salaries>=40000;
 
 # 5. get details of all dependents of essn 333445555
 select * from dependent 
 where essn=333445555;

# 6. get details of female employees who draw a salary of atleast 40000
select * from employee
where sex="F" and salaries>=40000;

# 7. get details of female employees or employees who draw a salary of atleast 40000
select * from employee
where sex="F" or salaries>=40000;

# 8. Display details of all (male employee who earn more than 40000) or (female employees who earn less than 40000)
select * from employee
where (sex="M" and salaries>40000) or (sex="F" and salaries<40000);

# 9. Retrieve details of projects that are based at Houston or Stafford
select * from project 
where plocation="Houston" or plocation="Stafford";
#                                      or
select * from project 
where plocation in ("Houston" , "Stafford");

# 10. Retrieve details of projects that are NOT based at Houston or Stafford
select * from project 
where plocation not in ("Houston" , "Stafford");

# 11. Display the essn of employees who have worked between 25 and 50 hours.
 select essn,hours from works_on
 where hours between 25 and 50;
 
 # 12. Display employees whose first name begins with 'A'.
 select fname from employee
 where fname like "A%";
 
 # 13. Display the name of emloyees who live in huston (from employee table). 
 select fname, address from employee
 where address like "%Houston%";
 
# 14. Display full names of all employees in one-go.
select concat(fname," ",lname) from employee;
#                     OR  
select concat_ws(" ",fname,minit,lname) as Full_Name from employee;

# Aggregate funtions in sql:- sum() , avg() , min() , max() , count()

# 15.a) Calculate total salary of employees.
select sum(salaries) from employee; 

# b) Calculate minimum salary of employees.
SELECT min(salary)    
FROM employee ;

# c) Calculate maximum salary of employees.
SELECT max(salary)    
FROM employee ;

# 16. Find no. of employees in organization.
SELECT COUNT(*) FROM employee;

# 17. Find no. of employees who have dependents.
select count(distinct essn) from dependent;

# 18. Display the employee details who does not have supervisor.
select * from employee
where super_ssn is null;

# 19. Display the ssn of manager and the year in which the manager was appointed.
select Mgr_ssn as 'manager_ssn', year(Mgr_start_date) as 'manager_appointed' 
from department; 

# 20. Display the ssn, fname and salary of employees sorted by their salary in descending mode.
select super_ssn,fname,salaries from employee 
order by salaries desc;

# 21. Sort the works_on table based on Pno and Hours.
select * from works_on
order by pno desc, hours desc;

# 22. Calculate average salary of employees department-wise.
select avg(salaries), dno from employee
group by dno;

# 23. Display the number of male employees in each department.
select DNO,count(sex) from employee 
where sex="M" 
group by DNO;

# 24. Among the people who draw at least 30000 salary, what is the gender-wise average?
select sex, avg(salaries) as mean_salary ,count(sex) as no_of_employees from employee
where salaries>=30000
group by sex
order by no_of_employees;

# we can use round(avg(salaries,2)) to get the round off figure  

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

# 25. Display the essn of employees who have worked between 25 and 50 hours.
 select essn,sum(hours) as total_hours from works_on
 group by essn
 having total_hours between 25 and 50;

# 26. Display the Dno of those departments those have at least 3 employees.
select dno, count(*) as no_of_employees from employee
group by dno
having no_of_employees >=3;

#                                                SUBQUERY

# 27. Display the fname and salary of employees whose salary is more than the average salary of all the employees.
select fname, salaries
from employee
where salaries> ( select avg(salaries) from employee ) ;

# 28. Display the fname of employees working in the Research department.
select fname,dno from employee
where dno= (select dnumber from department where dname="Research");

# 29. Which department has the most number of employees?
SELECT dno, COUNT(*) AS emp_count FROM employee
GROUP BY dno
HAVING emp_count = (SELECT MAX(emp_count) FROM (SELECT COUNT(*) AS emp_count, dno FROM employee GROUP BY dno) AS tab_1); 

# OR

select dno, count(*) as emp_count from employee
group by dno
order by emp_count desc 
limit 1;

# JOINS

select * 
from employee join department on employee.dno = department.Dnumber ;

#30 display fname of employees working in research department
select fname, dname from employee
join department on employee.dno = department.Dnumber
where dname="research";

# 31. Print full name of all employees working on Product 'Z'.
select concat(fname," ",minit," ", lname) ,dnum, pname 
from employee as e join works_on as w on e.ssn=w.essn join project as p on p.pnumber=w.pno
where pname="Productz"; 

# 32. Print full name and dept. name of all employees working on Product 'Z'.
select concat(fname," ",minit," ", lname) ,dnum, pname, Dname 
from employee as e join works_on as w on e.ssn=w.essn 
				   join project as p on p.pnumber=w.pno
                   join department as d on d.Dnumber=e.dno
where pname="Productz"; 

#                                             VIEWS 

create view apoorv as
select fname,lname from employee;

