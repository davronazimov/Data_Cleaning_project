-- While looking at data saw some mispellings in State names 
-- Lets check how many are there


SELECT State_Name, COUNT(State_Name) AS st_count
FROM us_household_income
GROUP BY State_Name;


-- One found by executing above query which is 'Georgia' spelled 'georia' 
-- But for some reason it's not showing 'Alabama' spelled 'alabama' 
-- We are going to update both anyways

UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

-- This one updated, now for the next

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

-- This is done too.

-- Lets also check the State_Abreviation column for any mispellings

SELECT State_ab, COUNT(State_ab) AS st_ab_count
FROM us_household_income
GROUP BY State_ab;

-- This looks good


-- Now check any missing value in Place column, l saw one 

SELECT *
FROM us_household_income
WHERE Place = '';

-- Only one found, we can populate this one easily

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE Place = '';

-- Now it's better, for the next column 'Type'

SELECT
    Type, COUNT(Type) AS type_count
FROM us_household_income
GROUP BY Type;

-- There is one here to update

UPDATE us_household_income
SET Type = 'Borough'
WHERE Type = 'Boroughs';



