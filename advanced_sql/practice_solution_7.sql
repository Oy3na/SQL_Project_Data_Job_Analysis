/*
Find the count of the number of remote job postings per skill.
  - Display the top 5 skills by their demand in remote jobs
  - Include skill ID, name, and count of remote job postings
  - Order the results by the count of remote job postings in descending order
*/
WITH remote_job_skills AS (
    SELECT
      skd.skill_id,
      COUNT(*) AS remote_job_count
    FROM
      skills_job_dim as skd
    INNER JOIN job_postings_fact as jpf
      ON skd.job_id = jpf.job_id
    WHERE
      jpf.job_work_from_home = True AND jpf.job_title_short = 'Data Analyst'
    GROUP BY
      skd.skill_id
)

SELECT 
  sk.skill_id,
  sk.skills,
  remote_job_skills.remote_job_count
FROM remote_job_skills
INNER JOIN skills_dim AS sk
  ON  sk.skill_id = remote_job_skills.skill_id
ORDER BY remote_job_skills.remote_job_count DESC
LIMIT 5;