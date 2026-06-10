/*

-- UNION
-- The UNION operator is used to combine the result sets of two or more SELECT statements.
-- Each SELECT statement within the UNION must have the same number of columns in the result sets with similar data types.

SELECT
  job_title_short,
  company_id,
  job_location
FROM
  january_job_postings

UNION -- Gets the jobs and companies from february that are not in january

SELECT
  job_title_short,
  company_id,
  job_location
FROM
  february_job_postings

UNION -- combines another month of job postings

SELECT
  job_title_short,
  company_id,
  job_location
FROM
  march_job_postings

*/

--UNION ALL
-- The UNION ALL operator is used to combine the result sets of two or more SELECT statements, but it does not remove duplicate rows. It returns all rows from the combined result set, including duplicates.

SELECT
  job_title_short,
  company_id,
  job_location
FROM
  january_job_postings

UNION ALL -- Gets all the jobs and companies from february, including those that are in january

SELECT
  job_title_short,
  company_id,
  job_location
FROM
  february_job_postings

UNION ALL -- combines another month of job postings

SELECT
  job_title_short,
  company_id,
  job_location
FROM
  march_job_postings