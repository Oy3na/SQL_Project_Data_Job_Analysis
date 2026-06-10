/*
Question: What skills are required for the top-paying data analyst role?
  - Use the top 10 jobs
  - Add the specific skill required
*/

WITH top_paying_jobs AS( 
  -- TOP 10 Data Analyst Roles in South Africa
        SELECT
            j.job_id,
            j.job_title,
            j.salary_year_avg,
            c.name AS company_name
        FROM 
            job_postings_fact AS j
        LEFT JOIN company_dim AS c
            ON j.company_id = c.company_id
        WHERE 
            j.job_title_short = 'Data Analyst'
            AND j.job_location LIKE '%South Africa%'
            AND j.salary_year_avg IS NOT NULL
        ORDER BY 
            j.salary_year_avg DESC
        LIMIT 10
    
)

SELECT 
  top_paying_jobs.*,
  s.skills
FROM 
  top_paying_jobs
INNER JOIN skills_job_dim AS sjk
  ON top_paying_jobs.job_id = sjk.job_id
INNER JOIN skills_dim as s
  ON sjk.skill_id = s.skill_id
ORDER BY 
  salary_year_avg DESC;