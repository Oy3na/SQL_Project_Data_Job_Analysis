CREATE TABLE job_applied (
    job_id INT,
    application_sent_date DATE NOT NULL,
    custom_resume BOOLEAN,
    resume_filename VARCHAR(255),
    cover_letter BOOLEAN,
    cover_letter_filename VARCHAR(255),
    status VARCHAR(50) NOT NULL
);

SELECT * FROM job_applied;

INSERT INTO job_applied 
        (job_id, 
        application_sent_date, 
        custom_resume, 
        resume_filename, 
        cover_letter, 
        cover_letter_filename, 
        status)
VALUES 
        (1, '2024-01-15', TRUE, 'resume_software_engineer.pdf', TRUE, 'cover_letter_software_engineer.pdf', 'Applied'),
        (2, '2024-02-10', FALSE, 'resume_generic.pdf', FALSE, NULL, 'Applied'),
        (3, '2024-03-05', TRUE, 'resume_data_scientist.pdf', TRUE, 'cover_letter_data_scientist.pdf', 'Interview Scheduled'),
        (4, '2024-04-20', FALSE, 'resume_generic.pdf', FALSE, NULL, 'Rejected'),
        (5, '2024-05-18', TRUE, 'resume_product_manager.pdf', TRUE, 'cover_letter_product_manager.pdf', 'Offer Received');