CREATE DATABASE datascience_salaries_2024;
SELECT * FROM datascience_salaries_2024;

-- Task 1: Data Overview and Exploration
-- i. Retrieve the first 10 rows of the dataset.
 create view First10_rows as
SELECT * FROM datascience_salaries_2024 LIMIT 10;

-- ii. Retrieve a list of distinct job_title values.
create view Distint_jobvalues as
SELECT DISTINCT JOB_TITLE 
FROM datascience_salaries_2024;
select * from distint_jobvalues;


-- iii.  Count how many unique employee locations (employee_residence) are present in the dataset
create view Employee_residence as 
SELECT DISTINCT EMPLOYEE_RESIDENCE 
FROM datascience_salaries_2024;
select * from employee_residence;

-- Task 2: Salary Analysis by Job Title and Country
-- i. Retrieve the job title and average salary for each job title, ordered from highest to lowest.
Create view Jobtitle_avgsalary as
select job_title,
 avg(salary)
 from datascience_salaries_2024 
 group by job_title
 order by avg(salary) desc;

-- ii. Get the top 5 highest paying job titles.
create view Jobtitle_salary5 as
select job_title, 
sum(salary)
 from datascience_salaries_2024 
 group by job_title 
 order by sum(salary)
 desc limit 5;

-- iii. Calculate the average salary for employees in different countries (company_location), filtering  only countries with at least 10 employees
create view companylocation_avgsalary10 as
SELECT company_location,
 AVG(salary) 
 AS avg_salary 
 FROM datascience_salaries_2024 
 GROUP BY company_location 
 HAVING COUNT(company_size) >= 10;

-- Task 3: Experience Level and Remote Work Impact
-- i. Calculate the average salary based on the experience_level of employees
create view experiencelevel_averagesalary as
select experience_level,
avg(salary) 
from datascience_salaries_2024 
group by experience_level;

-- ii. Find the average salary for employees who work fully remotely (remote_ratio = 100)
create view avg_salary_remote_ratio100 as
SELECT AVG(salary) 
AS average_remote_salary 
FROM datascience_salaries_2024 
WHERE remote_ratio = 100;

-- ii. Compare the average salary of employees who work fully remotely versus those who don’t (remote ratio less than 100).