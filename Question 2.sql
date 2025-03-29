WITH split_kilo AS(
select
	kilometers,
	SUBSTRING_INDEX(SUBSTRING_INDEX(kilometers, ' to ', 1), ' ', -1) as initial,
	SUBSTRING_INDEX(SUBSTRING_INDEX(kilometers, ' to ', 2), ' ', -1) as final,
    price_thousands
from
	cars_dev
)

SELECT
	ceil(((initial + final) / 2)) as avg_kilometers,
    AVG(price_thousands) as avg_price
FROM
	split_kilo
GROUP BY
	avg_kilometers
ORDER BY
	avg_price DESC;
    
-- As per Query, there is a slight correlation between milleage going up, and and prices going down.

-- Result not conclusive.
    