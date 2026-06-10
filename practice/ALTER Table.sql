/*
ALTER TABLE job_applied
ADD contact_name VARCHAR(50);

SELECT * FROM job_applied;

UPDATE job_applied
SET contact_name = 'John Doe'
WHERE job_id = 1;

UPDATE job_applied
SET contact_name = 'Marry Ann'
WHERE job_id = 2;

UPDATE job_applied
SET contact_name = 'John Seealy'
WHERE job_id = 3;

UPDATE job_applied
SET contact_name = 'August Booth'
WHERE job_id = 4;

UPDATE job_applied
SET contact_name = 'Temperance Brennan'
WHERE job_id = 5;
*/

/*
ALTER TABLE job_applied
ALTER COLUMN contact_name TYPE TEXT;
*/

-- Drop Column
ALTER TABLE job_applied
DROP COLUMN contact_name;