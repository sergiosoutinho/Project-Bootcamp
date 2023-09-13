#CREATE DATABASE project_two;
#USE project_two;
#DROP TABLE project_two.comments;

SELECT *
FROM project_two.badges;

SELECT *
FROM project_two.courses;

SELECT *
FROM project_two.locations;

SELECT *
FROM project_two.schools;

SELECT *
FROM project_two.comments;

/*
ALTER TABLE schools
ADD PRIMARY KEY (school_id);

ALTER TABLE comments
ADD PRIMARY KEY (id);
*/

# AVERAGE FOR SCHOOL
SELECT school, ROUND(AVG(overall),1) AS overall_avg, ROUND(AVG(curriculum),1) AS curriculum_avg, ROUND(AVG(jobSupport),1) AS jobSupport_avg, ROUND(AVG(overallScore),1) AS overallScore_avg
FROM project_two.comments
GROUP BY school;

#COURSE COUNT
SELECT school, COUNT(*)
FROM project_two.courses
GROUP BY school;

#DATA AVERAGE
SELECT program, ROUND(AVG(overall),1) AS overall_avg, ROUND(AVG(curriculum),1) AS curriculum_avg, ROUND(AVG(jobSupport),1) AS jobSupport_avg, ROUND(AVG(overallScore),1) AS overallScore_avg
FROM project_two.comments
WHERE school = "ironhack" AND program LIKE "%data%"
GROUP BY program;

#WEB AVERAGE
SELECT program, ROUND(AVG(overall),1) AS overall_avg, ROUND(AVG(curriculum),1) AS curriculum_avg, ROUND(AVG(jobSupport),1) AS jobSupport_avg, ROUND(AVG(overallScore),1) AS overallScore_avg
FROM project_two.comments
WHERE school = "ironhack" AND program LIKE "%web%"
GROUP BY program;

#UX AVERAGE
SELECT program, ROUND(AVG(overall),1) AS overall_avg, ROUND(AVG(curriculum),1) AS curriculum_avg, ROUND(AVG(jobSupport),1) AS jobSupport_avg, ROUND(AVG(overallScore),1) AS overallScore_avg
FROM project_two.comments
WHERE school = "ironhack" AND program LIKE "%UX%"
GROUP BY program;

#CYBER AVERAGE
SELECT program, ROUND(AVG(overall),1) AS overall_avg, ROUND(AVG(curriculum),1) AS curriculum_avg, ROUND(AVG(jobSupport),1) AS jobSupport_avg, ROUND(AVG(overallScore),1) AS overallScore_avg
FROM project_two.comments
WHERE school = "ironhack" AND program LIKE "%cyber%"
GROUP BY program;

# %STUDENTS BY SCHOOL
SELECT school, ROUND((COUNT(*) / (SELECT COUNT(*) FROM comments)),2) * 100 AS percent
FROM project_two.comments
GROUP BY school;

#school by country
SELECT country_name, count(*)
FROM project_two.locations
GROUP BY country_name;

SELECT country_name, project_two.comments.school, ROUND(AVG(overallScore),1)
FROM project_two.locations
INNER JOIN project_two.comments
ON project_two.locations.school = project_two.comments.school
GROUP BY country_name, school
ORDER BY country_name;


#clients BY SCHOOL
SELECT school, count(*)
FROM project_two.comments
GROUP BY school;