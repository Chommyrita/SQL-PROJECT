/* CONSTRAINT
SQL constraints are used to specify rules for data in a table
Constraints are used to limit the type of data that can go into a table. 
This ensures the accuracy and reliability of the data in the table. 
If there is any violation between the constraint and the data action, the action is aborted.
Constraints can be column level or table level. Column level constraints 
apply to a column, and table level constraints apply to the whole table.*/

create database MYSQL_constraint;
use MYSQL_constraint;
/* we have different types of constraints
1. not null
2.unique
3. primary key
4.foreign key
5. check
6.default */

/*1. NOT NULL
NOT NULL ensures that a column cannot have a "null" values
By default, a column can hold NULL values.
The NOT NULL constraint enforces a column to NOT accept NULL values.
By default, a column can hold NULL values.
The NOT NULL constraint enforces a column to NOT accept NULL values.
This enforces a field to always contain a value, which means that you cannot insert a new record,
 or update a record without adding a value to this field.*/
 
  --- creating a constraint
 /* we can create constraint while creating a table
 CREATE TABLE table_name (
    column1 datatype constraint,
    column2 datatype constraint,
    column3 datatype constraint,
    ....
); */

--- example
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL
);

insert into orders (
order_id,order_date)
values (1,"2024-11-09"),
(2,"2024-10-20");
select * from orders;

/* 2. check
  MYSQL ALTER TABLE Statement
The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.

The ALTER TABLE statement is also used to add and drop various constraints on an existing table.*/

--- ALTER THE EXISTING TABLE ABOVE AND CHECK TO IT
ALTER TABLE ORDERS ADD PRICE INT
CHECK (PRICE>1000);
select * from orders;

UPDATE ORDERS SET PRICE = 1200 WHERE ORDER_ID = 1;
select * from orders;

/* 3. DEFAULT
THE DEFAUT CONSTRAINT IS USED TO SET A DEFAULT VALUE FOR A COLUMN.

THE DEFAULT VALUE WILL BE ADDED TO ALL NEW RECORDS, IF NO OTHER VALUE IS SPECIFIED. */

ALTER TABLE ORDERS ADD COUNTRY CHAR (225);
select * from orders;

ALTER TABLE ORDERS
ALTER COUNTRY SET DEFAULT "NIGERIA";
select * from orders;

DESCRIBE ORDERS;
--- CHANGE COUNTRY DATATYPE FROM CHAR TO VARCHAR 100
ALTER TABLE ORDERS MODIFY COUNTRY VARCHAR (100);
DESCRIBE ORDERS;

/* UNIQUE
UNNQUE: ENSURES ALL VALUES IN A COLUMN ARE UNIQUE ACROSS ROWS.*/

ALTER TABLE ORDERS
ADD EMAIL VARCHAR (100) UNIQUE;
DESCRIBE ORDERS;

/* MySQL PRIMARY KEY Constraint:
The PRIMARY KEY constraint uniquely identifies each record in a table.

Primary keys must contain UNIQUE values, and cannot contain NULL values.

A table can have only ONE primary key; and in the table, 
this primary key can consist of single or multiple columns (fields). */

-- EXAMPLE
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

/* MySQL FOREIGN KEY Constraint
The FOREIGN KEY constraint is used to prevent actions that would destroy links between tables.

A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.

The table with the foreign key is called the child table, 
and the table with the primary key is called the referenced or parent table.*/

--- EXAMPLE
CREATE TABLE Orderx (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (personID) REFERENCES Persons(ID)
);
describe orders;












 

