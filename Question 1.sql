-- Which are the top 3 most expensive cars by Brand?

SELECT
	Brand,
    ROUND(AVG(price_thousands),0) `Average Price Per Brand`
FROM
	cars_dev
GROUP BY 
	Brand
ORDER BY
	AVG(price_thousands) DESC
LIMIT 3;

-- Hyundai	155
-- Chevrolet	145
-- Fiat	51


