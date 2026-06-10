/*
Find the total number of jobs in the first quarter
 - Combine the job postings from January, February, and March using UNION ALL
 - Filter the combined result to include only job postings with the average salary greater than $70,000
*/

WITH first_quarter_jobs AS (
  SELECT
    job_title_short,
    company_id,
    job_location,
    salary_year_avg
  FROM
    january_job_postings

  UNION ALL

  SELECT
    job_title_short,
    company_id,
    job_location,
    salary_year_avg
  FROM
    february_job_postings

  UNION ALL

  SELECT
    job_title_short,
    company_id,
    job_location,
    salary_year_avg
  FROM
    march_job_postings
)

SELECT
  job_title_short,
  job_location,
  salary_year_avg
FROM
  first_quarter_jobs
WHERE
  salary_year_avg > 70000
  AND
  job_title_short = 'Data Analyst'
ORDER BY
  salary_year_avg DESC