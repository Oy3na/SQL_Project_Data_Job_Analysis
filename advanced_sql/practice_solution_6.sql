CREATE TABLE january_job_postings AS
  SELECT *
  FROM
    job_postings_fact
  WHERE
    EXTRACT(MONTH from job_posted_date) = 1;

CREATE TABLE february_job_postings AS
  SELECT *
  FROM
    job_postings_fact
  WHERE
    EXTRACT(MONTH from job_posted_date) = 2;

CREATE TABLE march_job_postings AS
  SELECT *
  FROM
    job_postings_fact
  WHERE
    EXTRACT(MONTH from job_posted_date) = 3;
