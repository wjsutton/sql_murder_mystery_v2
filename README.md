# Solving the SQL Murder Mystery

There's been a Murder in SQL City, and here's how I solved it.

Finding witnesses to the murder that happened Jan.15, 2018, in SQL City
```
-- murder, Jan.15, 2018, in SQL City
SELECT 
  * 
FROM 
  crime_scene_report 
WHERE 
  type = 'murder' 
  AND date = 20180115 
  AND city = 'SQL City';
```
