SELECT
	*
FROM
	cars;
    
-- Split into PROD and DEV ENVs.
CREATE TABLE cars_dev LIKE cars;

INSERT INTO cars_dev
SELECT
	*
FROM
	cars;
-- Change Names of columns that are the same as reserved SQL keywords

SELECT
	*
FROM
	cars_dev;

ALTER TABLE cars_dev
CHANGE COLUMN `Year` year_released INT;

ALTER TABLE cars_dev
CHANGE COLUMN `Engine` engine_power text;

ALTER TABLE cars_dev
CHANGE COLUMN ID model_num INT;

ALTER TABLE cars_dev
CHANGE COLUMN `Price in thousands` price_thousands INT;


-- Dupe Check

WITH duplicate_cte as
(
SELECT 
	*,
	ROW_NUMBER() OVER(PARTITiON BY model_num,Brand,Model,Body,Color,year_released,Fuel,Kilometers,engine_power,Transmission,price_thousands) as row_num
FROM
	cars_dev
)
SELECT
	*
FROM
	duplicate_cte
WHERE
	row_num > 1;
    
-- No Dupes Found.

-- Null Check 

SELECT 
	*
FROM
	cars_dev
WHERE 
	model_num IS NULL OR
    Brand IS NULL OR
    Model IS NULL OR
    Body IS NULL OR
    Color IS NULL OR
    year_released IS NULL OR
    Fuel IS NULL OR
    Kilometers IS NULL OR
    engine_power IS NULL OR
    Transmission IS NULL OR
    price_thousands  IS NULL;
    
-- NO Nulls Found.