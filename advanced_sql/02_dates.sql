/*
SELECT 
    '2023-10-01'::DATE,
    '123' ::INTEGER,
    '123.45'::NUMERIC,
    'true'::BOOLEAN,
    '2023-10-01 12:00:00'::TIMESTAMP,
    '3.14'::REAL;
*/

/*
SELECT
  job_title_short AS job,
  job_location AS location,
  --convert to date data type
  job_posted_date ::DATE AS posting_date
FROM
  job_postings_fact
*/

/*
SELECT
  job_title_short AS job,
  job_location AS location,
  --convert timezone
  job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time
FROM
  job_postings_fact
LIMIT 5;
*/

/*
SELECT
  job_title_short AS job,
  job_location AS location,
  --convert to date data type
  job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST' AS date_time,
  -- Extract the month from the date_time column
  EXTRACT(MONTH FROM job_posted_date) AS date_month,
  -- Extract the year from the date_time column
  EXTRACT(YEAR FROM job_posted_date) AS date_year
FROM
  job_postings_fact
LIMIT 5;
*/

SELECT
  COUNT(job_id) AS total_jobs,
  EXTRACT(MONTH from job_posted_date) AS month
FROM
  job_postings_fact
WHERE
  job_title_short = 'Data Scientist'
GROUP BY
  month
ORDER BY
  total_jobs DESC;