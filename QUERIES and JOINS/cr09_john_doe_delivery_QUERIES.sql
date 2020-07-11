				
				-- QUERIES QUERIES QUERIES QUERIES 


-- 1.) HOW MANY EMPLOYEES ARE WORKING SINCE 2018 AND WHO ARE THEY?
SELECT first_name,last_name,hire_date FROM employee WHERE employee.hire_date > "2018-01-01"

-- 2.) HOW MANY EMPLOYEES WITH THE FIRST NAME "Mujo" AND THE LAST NAME BEGINNING WITH "M" DO WE HAVE IN OUR COMPANY?
SELECT COUNT(first_name),(last_name) FROM employee WHERE employee.first_name = "Mujo" AND employee.last_name LIKE "M%"

-- 3.) HOW MANY ROWS DO WE HAVE IN THE TABLE ADDRESS? 
SELECT COUNT(*) FROM address

-- 4.) HOW MANY EMPLOYEES GOT HIRED FROM 2015 AND 2018 AND WHO ARE THEY?
SELECT * FROM employee WHERE employee.hire_date >= "2015-01-01" AND employee.hire_date <='2018-12-31'

-- 5.) HOW MANY RECIPIENTS WITH THE LAST NAME "Hoffa" DO WE HAVE IN THE DATABASE?
SELECT COUNT(last_name) FROM recipient WHERE recipient.last_name = "Hoffa"

-- 6.) WHICH RECIPIENT GOT WHICH PACKAGE?
SELECT * FROM recipient INNER JOIN package ON package.package_id = recipient.recipient_id

-- 7.) WHICH EMPLOYEE DELIVERED PACKAGES ON "2020-07-06"?
SELECT * FROM employee INNER JOIN package ON package.package_id = employee.employee_id WHERE package.date_sent = "2020-07-06"

