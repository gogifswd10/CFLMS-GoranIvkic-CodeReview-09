			
				-- JOINS JOINS JOINS JOINS

-- 1.) CONNECTS 3 TABLES "customer", "package" AND "employee".
SELECT * FROM customer LEFT JOIN package ON package.package_id = customer.customer_id LEFT JOIN employee ON employee.employee_id = customer.customer_id

-- 2.) CONNECTS 4 TABLES "customer", "package", "employee" AND "recipient".
SELECT * FROM customer LEFT JOIN package ON package.package_id = customer.customer_id LEFT JOIN employee ON employee.employee_id = customer.customer_id LEFT JOIN recipient ON recipient.recipient_id = customer.customer_id

-- 3.) CONNECTS 5 TABLES "customer", "package", "employee", "recipient" AND "process" (office).
SELECT * FROM customer LEFT JOIN package ON package.package_id = customer.customer_id LEFT JOIN employee ON employee.employee_id = customer.customer_id LEFT JOIN recipient ON recipient.recipient_id = customer.customer_id LEFT JOIN process ON process.process_id = customer.customer_id
