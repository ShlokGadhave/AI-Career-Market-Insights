USE ai;
SELECT*FROM MARKET;

-- Top 10 Highest Paying Job Roles
SELECT job_category,avg(annual_salary_usd) as avg_salary 
FROM Market 
GROUP BY job_category 
ORDER BY avg_salary DESC 
LIMIT 10;

-- Average Salary by Country

SELECT country,
AVG(annual_salary_usd) AS avg_salary
FROM Market
GROUP BY country
ORDER BY avg_salary DESC;

-- Count Remote Jobs by Country

SELECT country,
COUNT(*) AS remote_jobs
FROM Market
WHERE remote_work = 1
GROUP BY country
ORDER BY remote_jobs DESC;