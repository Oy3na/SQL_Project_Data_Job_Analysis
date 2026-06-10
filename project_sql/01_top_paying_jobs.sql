/*
Question: What are the top-paying data analyst roles?
  - Identify the top-paying data analyst roles that in South Africa and Remote (Anywhere) locations.
  - Focus on jobs with specified salaries (remove null values)
*/

WITH top_paying_jobs AS (
  -- TOP 10 Data Analyst Roles in South Africa
    (
        SELECT
            j.job_id,
            j.job_title,
            j.job_location,
            j.job_schedule_type,
            j.salary_year_avg,
            j.job_posted_date,
            c.name AS company_name
        FROM job_postings_fact j
        LEFT JOIN company_dim c
            ON j.company_id = c.company_id
        WHERE j.job_title_short = 'Data Analyst'
            AND j.job_location LIKE '%South Africa%'
            AND j.salary_year_avg IS NOT NULL
        ORDER BY j.salary_year_avg DESC
        LIMIT 10
    )

    UNION ALL
  -- TOP 10 Data Analyst Roles Remote
    (
        SELECT
            j.job_id,
            j.job_title,
            j.job_location,
            j.job_schedule_type,
            j.salary_year_avg,
            j.job_posted_date,
            c.name AS company_name
        FROM job_postings_fact j
        LEFT JOIN company_dim c
            ON j.company_id = c.company_id
        WHERE j.job_title_short = 'Data Analyst'
            AND j.job_location = 'Anywhere'
            AND j.salary_year_avg IS NOT NULL
        ORDER BY j.salary_year_avg DESC
        LIMIT 10
    )
)

SELECT *
FROM top_paying_jobs
ORDER BY salary_year_avg DESC;

