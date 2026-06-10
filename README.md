# Introduction
📊 Dive into the data job market! Focusing on data analyst roles, this project explores 💰 top-paying jobs, 🔥 in-demand skills, and 📈 where high demand meets high salary in data analytics.

🔍 SQL queries? Check them out here: [project_sql folder](/project_sql/)

# Background
Driven by a quest to navigate the data analyst job market more effectively, this project was born from a desire to pinpoint top-paid and in-demand skills, streamlining others work to find optimal jobs.

The questions I wanted to answer through my SQL queries were:
- What are the top-paying data analyst jobs?
- What skills are required for these top-paying jobs?
- What skills are most in demand for data analysts?
- Which skills are associated with higher salaries?
- What are the most optimal skills to learn?

# Tools I Used
For my deep dive into the data analyst job market, I harnessed the power of several key tools:

- **SQL**: The backbone of my analysis, allowing me to query the database and unearth critical insights.
- **PostgreSQL**: The chosen database management system, ideal for handling the job posting data.
- **Visual Studio Code**: My go to for database management and executing SQL queries.
- **Git & GitHub**: Essential for version control and sharing my SQL scripts and analysis, ensuring collaboration and project tracking.

# The Analysis
Each query for this project aimed at investigating specific aspects of the data analyst job market. Here’s how I approached each question:

### 1. Top Paying Data Analyst Jobs
To identify the highest-paying roles, I filtered data analyst positions by average yearly salary and location, focusing on jobs in South Africa. This query highlights the high paying opportunities in the field.

```sql
SELECT
    j.job_id,
    j.job_title,
    j.job_location,
    j.job_schedule_type,
    j.salary_year_avg,
    j.job_posted_date,
        c.name AS company_name
FROM job_postings_fact j
LEFT JOIN company_dim c
    ON j.company_id = c.company_id
WHERE j.job_title_short = 'Data Analyst'
    AND j.job_location LIKE '%South Africa%'
    AND j.salary_year_avg IS NOT NULL
    ORDER BY j.salary_year_avg DESC
LIMIT 10
```
### Key Insights
**1. Salary Distribution**

Highest-paying role: 
- Data Architect — R165,000

Lowest-paying role: 
- Data Analyst - R100,500

Average salary: 
- R113,453
Median salary: 
- R111,175

**2. Most Common Salary Range**

Several roles are clustered around R111,175, including:
- Senior Data Analyst II
- Deloitte Consulting: Data Analyst
- Data Analyst - Insurance
- Marketplace Operations Data Analyst
- Data Analyst - Marketing

This suggests a common market rate for experienced Data Analyst positions.

**3. Highest-Paying Career Path**

The Data Architect role pays approximately:
- 48% more than the average salary in the dataset.
- 63% more than the lowest-paid role.

This indicates that moving toward Data Architecture, Data Engineering, or Cloud Data Solutions can significantly increase earning potential.

**4. Geographic Insights**

Top-paying opportunities are concentrated in:
- Cape Town
- Johannesburg

These cities account for most of the highest-paying data positions.

**5. Companies Appearing Multiple Times**

The following companies have multiple listings:
- Standard Bank Group (3 jobs)
- takealot.com (3 jobs)

This suggests these organizations are major employers of data professionals in South Africa.

![Top Paying Role](assets\top_paying_jobs_visualization.png)
*ChatGPT generated this graph based on my results*

### 2. Skills for Top Paying Jobs
```sql
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
```
🛠️ Most In‑Demand Skills
Core Technical Skills:
- SQL, Python, NoSQL, Spark, Hadoop, Kafka

Cloud & Big Data Tools:
- AWS, GCP, BigQuery, Redshift, Databricks

Visualization & BI Tools:
- Power BI, Tableau, Looker, Qlik, Excel, Google Sheets
![Skills for Top Paying Roles](assets\skills_for_top_paying_role.png)
*Copilot generated this graph based on my results*

### 3. In Demand Skills
```sql
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
```
🧮 Top In‑Demand Data Analyst Skills in South Africa
- SQL dominates with the highest demand (≈85% of listings).
- Power BI and Python follow closely, reflecting the blend of technical and visualization skills employers seek.
- Excel remains essential for business reporting.
- Cloud tools (AWS/GCP) appear increasingly relevant for modern data workflows.

![In Demand Skills](assets\in_demand_skills_for_da.png)
*Copilot generated this graph based on my results*

### 4. Top Paying Skills
```sql
SELECT 
  s.skills,
  ROUND(AVG(jpf.salary_year_avg), 2) AS average_salary
FROM 
  job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjk
  ON jpf.job_id = sjk.job_id
INNER JOIN skills_dim as s
  ON sjk.skill_id = s.skill_id
WHERE
  jpf.job_title_short = 'Data Analyst'
  AND jpf.salary_year_avg IS NOT NULL
  AND jpf.job_location LIKE '%South Africa'
GROUP BY 
  s.skills
ORDER BY
  average_salary DESC
LIMIT 30
```
**1.  Highest‑Paying Skills**
- Spark (R126,225) and Databricks (R124,892) lead the pack — both are advanced data engineering tools used for big data processing and analytics.
- AWS (R106,938) ranks third, showing the growing importance of cloud infrastructure expertise.

**2. Strong Mid‑Tier Skills**
- Java, Airflow, C++, Scala, and Kafka all average around R105K–R107K, indicating that programming and workflow automation skills are highly valued.
- BigQuery, NoSQL, and PySpark follow closely, reflecting demand for scalable data solutions.

**3. Visualization & Reporting Tools**

- Tableau (R90K), Power BI (R78K), and Excel (R85K) remain essential but pay less than engineering‑focused tools — suggesting visualization skills are valuable but not premium.

**4. Emerging Cloud & Collaboration Tools**
- Git and Bitbucket (≈R100K) highlight the importance of version control and collaboration in modern data teams.

**5. Overall Trend**

- The highest salaries are tied to data engineering and cloud technologies, while traditional analytics tools offer moderate pay.
- Upskilling in Spark, Databricks, and AWS can significantly boost earning potential for South African data professionals.

![Top Paying Skills for Data Analyst](assets\top_paying_skills.png)
*Copilot generated this graph based on my results*

### 5. Optimal Skills (HIgh Demnad and High Pay)
```sql
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
```
***⚙️ Key Insights: Optimal Skills for Data Analysts in South Africa***

**1. Core Technical Foundation — SQL**
- SQL (R78,554) remains the most demanded skill, appearing in 20 listings.
- It’s the backbone of data querying and manipulation, making it indispensable for analysts.

**2. Balanced Skill Mix — Python, Excel, Power BI**
- Python (R94,836) leads among programming tools, offering both automation and analytical power.
- Excel (R84,740) and Power BI (R77,916) are equally in demand (8 listings each), showing the importance of business reporting and visualization.

**3. Specialized Visualization Tools — Looker & Tableau**
- Looker (R94,375) and Tableau (R90,136) appear in 6 listings each, reflecting their growing use in enterprise analytics and cloud‑based dashboards.

**4. Optimal Skill Strategy**
- Combining SQL + Python + Power BI provides the best balance between high demand and competitive pay.
- Adding Looker or Tableau enhances visualization depth and increases salary potential.

**5. Overall Trend**
- South African employers value data manipulation (SQL), automation (Python), and visual storytelling (Power BI/Tableau) — a synergy of technical and business intelligence skills.

![Optimal Skills for Data Analyst](assets\optimal_skills_for_data_analyst.png)
*Copilot generated this graph based on my results*

# What I Learned
What started as simple data queries evolved into a full‑blown mastery of SQL. I’ve learned to think like a data architect — building, shaping, and interrogating datasets with precision and creativity.

- 🧩 Complex Query Crafting: I now merge tables effortlessly, design multi‑layered queries, and use WITH clauses to orchestrate temporary tables like a strategist.

- 📊 Data Aggregation: GROUP BY became my compass, guiding me through patterns and insights, while aggregate functions like COUNT() and AVG() turned raw data into clear stories.

- 💡 Analytical Wizardry: Each challenge sharpened my ability to translate real‑world problems into elegant, actionable SQL solutions — transforming questions into insights that drive decisions.
# Conclusions

**Insights**

From the analysis, several general insights emerged:
- **Top-Paying Data Analyst Jobs:** The highest-paying jobs for data analysts is South Africa is Data Architect at R165,000!
- **Skills for Top-Paying Jobs:** High-paying data analyst jobs require advanced proficiency in SQL, suggesting it’s a critical skill for earning a top salary.
- **Most In-Demand Skills:** AWS which required being able to work with cloud databases.
- **Optimal Skills for Job Market Value:** SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.

**Closing Thoughts**

This project enhanced my SQL skills and provided valuable insights into the data analyst job market. The findings from the analysis serve as a guide to prioritizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continuous learning and adaptation to emerging trends in the field of data analytics.
