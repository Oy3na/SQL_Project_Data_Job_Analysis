SELECT
  COUNT(job_id) AS total_jobs,
  -- case statement to categorize job location
  CASE
    WHEN job_location = 'Anywhere' THEN 'Remote'
    WHEN job_location = 'New York, NY' THEN 'Local'
    ELSE 'Onsite'
  END AS location_type
FROM
  job_postings_fact
WHERE
  job_title_short = 'Data Scientist'
GROUP BY
  location_type;