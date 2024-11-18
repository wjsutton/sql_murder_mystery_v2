-- murder, Jan.15, 2018, in SQL City
SELECT * 
FROM crime_scene_report
WHERE type = 'murder'
AND date = 20180115
AND city = 'SQL City';

-- The first witness lives at the last house on "Northwestern Dr". 
-- 14887	Morty Schapiro
SELECT * 
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

-- The second witness, named Annabel, lives somewhere on "Franklin Ave".
-- 16371	Annabel Miller
SELECT * 
FROM person
WHERE address_street_name = 'Franklin Ave'
AND LOWER(name) LIKE '%annabel%';

-- Interview transcripts 
SELECT * 
FROM interview
WHERE person_id IN (16371,14887)


--  man run out. "Get Fit Now Gym" bag membership started with "48Z"
-- Only gold members have those bags, got into a car with a plate that included "H42W"
--  last week on January the 9th.

SELECT p.* 
FROM get_fit_now_member as gf
INNER JOIN person as p on p.id = gf.person_id 
INNER JOIN drivers_license as dl on dl.id = p.license_id
WHERE membership_status = 'gold'
AND gf.id LIKE '48Z%'
AND plate_number LIKE '%H42W%'
LIMIT 10

-- Killer's interview
SELECT *
FROM interview 
WHERE person_id = 67318

-- a woman, she's around 5'5" (65") or 5'7" (67").
-- red hair and she drives a Tesla Model S
-- SQL Symphony Concert 3 times in December 2017
WITH CONCERT as (
SELECT 
person_id, 
COUNT(*) as sql_symphony_visits
FROM facebook_event_checkin
WHERE event_name = 'SQL Symphony Concert'
AND date BETWEEN 20171201 AND 20171231
GROUP BY person_id
HAVING COUNT(*) = 3
)

SELECT name
FROM CONCERT as C
INNER JOIN person as P on P.id = C.person_id
INNER JOIN drivers_license as DL on DL.id = P.license_id
WHERE hair_color = 'red'
AND gender = 'female'
AND height BETWEEN 65 AND 67
AND car_make = 'Tesla'
AND car_model = 'Model S'
