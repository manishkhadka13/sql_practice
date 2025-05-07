--Average salary for each department
SELECT department,AVG(salary) as average_salary
FROM employees
GROUP BY Department;

--Two highest paid employees
SELECT name,salary
FROM employees
ORDER BY salary desc
LIMIT 2;

--Total salary expenses for each city
SELECT city, SUM(salary) as total_salary
FROM employees
GROUP BY city;

--Average experience in each department
SELECT department,AVG(experience) as average_experience
FROM employees
GROUP BY department

-- Employees who earn more than the average salary
SELECT *
FROM employees
WHERE salary>(SELECT AVG(salary) as avg_salary FROM employees);

--Rank employees by experience(Highest to lowest)
SELECT employee_id,name,experience,RANK() OVER(ORDER BY experience DESC) FROM employees;

--For each department, highest paid employee
SELECT department,name,salary
FROM employees
WHERE(department,salary) IN (
SELECT department,MAX(salary)
FROM employees
GROUP BY department
);

--Find cities with more than one employee.
SELECT city
FROM employees
GROUP BY city
HAVING COUNT(employee_id)>1;

--For each department, count how many employees are over 50.
SELECT department,COUNT(*) as empover50
FROM employees
WHERE age>50
GROUP BY department;

--Employees who share both the same age and department.
SELECT e1.name,e1.age,e1.department
FROM employees e1
JOIN employees e2
ON e1.age=e2.age AND e1.department=e2.department
WHERE e1.employee_id!=e2.employee_id;

--Department with highest salary
SELECT department,SUM(salary) as total_salary
FROM employees
GROUP BY department
ORDER BY SUM(salary) DESC
LIMIT 1;