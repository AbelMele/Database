--Abel 
--Creating Company System Database
--Create table Employee
create table Employee (
employee_id int primary key,
first_name varchar(50),
last_name varchar(50),
company_email varchar(100),
phone_number varchar(20),
hired_date Date,
job_id int,
salary decimal(10,2),
commission_percentage decimal(5,2),
manager_id int,
department_id int,
foreign key(job_id) references job(job_id)
foreign key(manager_id) references Employee(employee_id),
foreign key(department_id) references department(department_id)
);

 --Add Foreign Key using Alter  
Alter table Employee
add foreign key (department_id)
references department(department_id);

--Make sure the Data inserted in the table
select * from Employee

--Create table department
create table department(
department_id int primary key,
department_name varchar(100),
manager_id int,
location_id int,
foreign key(manager_id) references Employee(employee_id),
foreign key(location_id) references Location(location_id)	
);

--Create table job
create table job(
job_id int primary key,
job_title varchar(100),
min_salary Decimal(10,2),
max_salary Decimal(10,2)		
);

--Create table JobHistory
create table JobHistory(
employee_id int,
start_date Date,
primary key(employee_id, start_date),
foreign key(employee_id) references Employee(employee_id)	
);

--Create table Location
create table Location (
location_id int primary key,
street_address varchar(255),
postal_code varchar(20),
city varchar(100),
state varchar(100),
country_id int,
foreign key(country_id) references country(country_id)	
);

--Create table country
create table country (
country_id int primary key,
country_name varchar(100),
region_name varchar(100)	
);
  
--Insert 10 Value in Employee Table
insert into Employee (employee_id, first_name, last_name, company_email, phone_number, hired_date,job_id,salary,commission_percentage,manager_id)
values 
		(1,'Abel','Melese','Abelmelese@company.com','240-546-8451','2023-07-01',1,3000,0.07,1)
        (2,'john','Doe','johnD@company.com','240-789-4762','2023-07-01',2,1500,0.07,2)
        (3,'Michael ','Johnson','Micaelj@company.com','240-208-6146','2023-08-01',3,3000,0.07,3)
        (4,'Emily','Davis','EmilyDavis@company.com','202-621-2102','2023-07-01',4,1500,0.05,4)
         (5,'Jane',' Smith','janeS@company.com','416-519-2264','2023-08-01',5,3000,0.07,5);
		(6,'Anne',' Teak','AnneT@company.com','626-805-9427','2023-09-01',6,3000,0.05,6),
		(7,'Lee',' A.sun','Leesun@company.com','480-321-5678','2023-08-01',7,1500,0.12,7),
		(8,'Isabelle',' Norda','oliveYew@company.com','263-456-4561','2023-07-01',8,1500,0.07,8),
		(9,'olive',' Yew','oliveYew@company.com','343-756-2451','2023-09-01',9,1500,0.07,9),
		(10,'peter',' owt','peterowt@company.com','368-642-6478','2023-08-01',10,1500,0.12,10) ; 

--Update the value that are inserted by Foreign Key  
UPDATE Employee set department_id=1 where employee_id=1 ;


--Insert 10 Value in department Table
insert into department (department_id, department_name, manager_id,location_id)
values (1, 'Human Resourse department',1,1),
       ( 2, 'Planning departmen',2,2),
       (3, 'Finance departmen',3,3),
       (4, ' Customer Service departmen',4,4),
	   (5, ' Marketing  departmen',5,5),
	   (6, 'Management departmen',6,6),
	   (7, 'Quality Assurance departmen',7,7),
	   (8, ' Production departmen',8,8),
	   (9, ' IT departmen',9,9),
	   (10, 'Research and Development departmen',10,10);
	   
--Insert 10 Value in job Table	       	   			  
insert into job (job_id, job_title, min_salary, max_salary)
values (1, 'Human Resource Manager',1500.00,3000.00),
       (2, 'Senior planner', 1000.00,1500.00),
	   (3, 'Finance Analyst', 1500.00,3000.00),
	   (4, 'call center Representative', 1000.00,1500.00),
	   (5, ' Marketing management',1500.00,3000.00),
	   (6, 'Branch manager', 1500.00,3000.00),
	   (7, 'Quality technician', 1000.00,1500.00),
	   (8, 'Assistant operator', 1000.00,1500.00),
	   (9, 'web developer', 1000.00,1500.00),
	   (10, 'Research assistant', 1000.00,1500.00);

--Insert 10 Value in JobHistory Table	
insert into JobHistory (employee_id, start_date)
values (1,'2023-07-01'),
       (2,'2023-07-01'), 
	   (3,'2023-08-01'),
	   (4,'2023-07-01'),
	   (5,'2023-08-01'),
	   (6,'2023-09-01'),
	   (7,'2023-08-01'),
	   (8,'2023-07-01'),
	   (9,'2023-09-01'),
	   (10,'2023-08-01');
	   
--Insert 10 Value in Location Table	 
insert into Location ( location_id, street_address, postal_code, city, state, country_id)
values (1,'2622 Chestnut st ', '54566', 'Bethesda','Maryland',1),
       (2,'5426 Pearl st ', '9452', 'Bethesda','Maryland',2),
	   (3,' 8645 Fenton St ', '54566', 'silver spring','Maryland',1),  
	   (4,'5645 North Capitol', '6472', ' Washington Dc','DC',1),        
	   (5,'9452 Chestnut st ', '1452', 'ottawa','ontario',2),           
	   (6,'6472 Chestnut st ', '3211', 'Los angeles','California',1),    
	   (7,'6542 Chestnut st ', '3452', ' Yuma','Arizona',1),             
	   (8,'3452 Chestnut st ', '8645', 'Montreal','Quebec',2),                     
	   (9,'3211 Chestnut st ', '2622', ' ottawa','ontario',2),  
	   (10,'1452 Chestnut st ', '5426', 'calgary','Alberta',2);  

--Insert Value in country Table
insert into country (country_id, country_name, region_name)
values (1,'United States', 'North America'),
       (2,'Canada','North America');
--Get all table values using
--select * from or 
select e.employee_id,e.first_name,e.last_name,e.company_email,d.department_id,j.job_title,l.city,c.country_name
from Employee e
inner join department d on e.department_id = d.department_id
inner join job j on e.job_id = j.job_id
inner join Location l on d.location_id = l.location_id
inner join country c on l.country_id = c.country_id;
        
	   
	   
	   
	   