
SELECT *
FROM (
    SELECT 
        row_id,
        id,
        ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
    FROM us_household_income
) duplicates
WHERE row_num > 1;

-- Found some duplicated ids



DELETE FROM us_household_income
WHERE row_id IN (
    SELECT row_id
    FROM (
        SELECT 
            row_id,
            id,
            ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) AS row_num
        FROM us_household_income
    ) duplicates
WHERE row_num > 1);


-- Deleted the duplicate rows