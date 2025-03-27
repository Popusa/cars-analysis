SELECT 
	kilometers,
    AVG(price_thousands)
FROM
	cars_dev
GROUP BY
	Kilometers
ORDER BY
	AVG(price_thousands) DESC;