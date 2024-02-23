--Finding the most popular names in the most recent year of the dataset
SELECT name, MAX(number) as number
FROM bigquery-public-data.usa_names.usa_1910_current
WHERE year = (SELECT MAX(year) as latest_year 
  FROM bigquery-public-data.usa_names.usa_1910_current)
GROUP BY name
ORDER BY number DESC
LIMIT 5;
