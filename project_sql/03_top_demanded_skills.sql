/*
Question: What are the most in-demand skills for data analysts in South Africa?
*/

SELECT 
  s.skills,
  COUNT(sjk.job_id) AS demand_count
FROM 
  job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjk
  ON jpf.job_id = sjk.job_id
INNER JOIN skills_dim as s
  ON sjk.skill_id = s.skill_id
WHERE
  jpf.job_title_short = 'Data Analyst'
  AND 
  jpf.job_location LIKE '%South Africa'
GROUP BY 
  s.skills
ORDER BY
  demand_count DESC
LIMIT 5