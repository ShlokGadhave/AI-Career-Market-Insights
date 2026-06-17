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
WHERE is_remote_friendly = 1
GROUP BY country
ORDER BY remote_jobs DESC;

-- Total Jobs for Each Company Size

SELECT company_size,
COUNT(*) AS total_jobs
FROM Market
GROUP BY company_size
ORDER BY total_jobs DESC;

-- Top Industries by Demand Score

SELECT industry,
AVG(demand_score) AS avg_demand
FROM Market
GROUP BY industry
ORDER BY avg_demand DESC;

-- Highest Paying Remote Jobs

SELECT job_title,
AVG(annual_salary_usd) AS avg_salary
FROM Market
WHERE is_remote_friendly = 1
GROUP BY job_title
ORDER BY avg_salary DESC
LIMIT 10;

-- Average Salary by Experience Level

SELECT experience_level,
AVG(annual_salary_usd) AS avg_salary
FROM Market
GROUP BY experience_level
ORDER BY avg_salary DESC;

-- Countries with More Than 100 Job Postings

SELECT country,
COUNT(*) AS total_jobs
FROM Market
GROUP BY country
HAVING COUNT(*) > 100
ORDER BY total_jobs DESC;

-- Top Skills Frequency

SELECT required_skills,
COUNT(*) AS frequency
FROM Market
GROUP BY required_skills
ORDER BY frequency DESC
LIMIT 10;

-- Roles Where Salary is Above Global Average

SELECT job_title,
AVG(annual_salary_usd) AS avg_salary
FROM Market
GROUP BY job_title
HAVING AVG(annual_salary_usd) >
(
SELECT AVG(annual_salary_usd)
FROM Market
)
ORDER BY avg_salary DESC;

-- Rank Countries by AI Salary

SELECT country,
AVG(annual_salary_usd) AS avg_salary,
RANK() OVER(
ORDER BY AVG(annual_salary_usd) DESC
) AS salary_rank
FROM Market
GROUP BY country;

-- Salary Difference Between Remote and Onsite Jobs

SELECT remote_work,
AVG(annual_salary_usd) AS avg_salary
FROM Market
GROUP BY remote_work
Order By avg_salary desc;

-- Top 5 Growing Job Roles

SELECT job_title,
AVG(demand_growth_yoy_pct) AS growth_rate
FROM Market
GROUP BY job_title
ORDER BY growth_rate DESC
LIMIT 5;

-- Jobs Requiring Python and SQL Together

SELECT *
FROM Market
WHERE required_skills LIKE '%Python%'
AND required_skills LIKE '%SQL%';

-- Highest Paying Industries

SELECT industry,
AVG(annual_salary_usd) AS avg_salary
FROM Market
GROUP BY industry
ORDER BY avg_salary DESC;

-- Demand Trend Over Years

SELECT posting_year,
AVG(demand_score) AS avg_demand
FROM Market
GROUP BY posting_year
ORDER BY posting_year;

-- Average Salary for LLM Roles

SELECT
AVG(annual_salary_usd) AS avg_salary
FROM Market
WHERE is_llm_role = 1;

-- Cities with Highest AI Opportunities

SELECT city,
COUNT(*) AS total_jobs
FROM Market
GROUP BY city
ORDER BY total_jobs DESC
LIMIT 10;

-- Most Common Employment Type

SELECT job_category,
COUNT(*) AS total_jobs
FROM Market
GROUP BY job_category
ORDER BY total_jobs DESC;

-- SQL Views for Dashboard Usage

-- Salary Dashboard View

CREATE VIEW salary_dashboard AS
SELECT
job_title,
country,
annual_salary_usd,
experience_level,
remote_work
FROM Market;

-- Demand Dashboard View

CREATE VIEW demand_dashboard AS
SELECT
job_title,
industry,
demand_score,
demand_growth_yoy_pct
FROM Market;

-- Country Dashboard View

CREATE VIEW country_dashboard AS
SELECT
country,
COUNT(*) AS total_jobs,
AVG(annual_salary_usd) AS avg_salary
FROM Market
GROUP BY country;