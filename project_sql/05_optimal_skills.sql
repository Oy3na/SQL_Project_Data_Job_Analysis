/*
Question: What are the most optimal skills to learn
(high demand and high paying)?
*/

WITH skills_demand AS (
    SELECT
        s.skill_id,
        s.skills,
        COUNT(sjk.job_id) AS demand_count
    FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjk
        ON jpf.job_id = sjk.job_id
    INNER JOIN skills_dim AS s
        ON sjk.skill_id = s.skill_id
    WHERE
        jpf.job_title_short = 'Data Analyst'
        AND jpf.salary_year_avg IS NOT NULL
        AND jpf.job_location LIKE '%South Africa'
    GROUP BY
        s.skill_id,
        s.skills
),

average_salary AS (
    SELECT
        s.skill_id,
        s.skills,
        ROUND(AVG(jpf.salary_year_avg), 2) AS avg_salary
    FROM job_postings_fact AS jpf
    INNER JOIN skills_job_dim AS sjk
        ON jpf.job_id = sjk.job_id
    INNER JOIN skills_dim AS s
        ON sjk.skill_id = s.skill_id
    WHERE
        jpf.job_title_short = 'Data Analyst'
        AND jpf.salary_year_avg IS NOT NULL
        AND jpf.job_location LIKE '%South Africa'
    GROUP BY
        s.skill_id,
        s.skills
)

SELECT
    sd.skill_id,
    sd.skills,
    sd.demand_count,
    avs.avg_salary
FROM skills_demand AS sd
INNER JOIN average_salary AS avs
    ON sd.skill_id = avs.skill_id
WHERE sd.demand_count > 5
ORDER BY
    sd.demand_count DESC,
    avs.avg_salary DESC;