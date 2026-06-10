/*
-- Subqqueries 

SELECT *
FROM ( -- Subquery starts here
  SELECT * 
  FROM job_postings_fact
  WHERE EXTRACT(MONTH FROM job_posted_date) = 5
) AS may_jobs -- Subquery ends here

*/

/*
-- Common Table Expressions (CTEs)

WITH may_jobs AS ( -- CTE starts here
  SELECT * 
  FROM job_postings_fact
  WHERE EXTRACT(MONTH FROM job_posted_date) = 5
) -- CTE ends here

SELECT *
FROM may_jobs;

*/

/*
-- Practice problem with Subqueries

SELECT
  company_id,
  name AS company_name
FROM
  company_dim
WHERE  company_id IN ( -- Subquery starts here
    SELECT company_id
    FROM job_postings_fact
    WHERE job_no_degree_mention = true
  ) -- Subquery ends here

*/

/*
-- Practice problem with CTEs

WITH company_job_counts AS (
  SELECT
    company_id,
    COUNT(*) AS total_jobs
  FROM
    job_postings_fact
  GROUP BY
    company_id
)

SELECT
  company_dim.name AS company_name,
  company_job_counts.total_jobs
FROM
  company_dim
INNER JOIN
  company_job_counts ON company_dim.company_id = company_job_counts.company_id
ORDER BY
  company_job_counts.total_jobs DESC;

*/