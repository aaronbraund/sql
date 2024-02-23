-- Finding the top 5 trending terms from BigQuery using GPT to prompt challenges
SELECT 
	term, rank, score, week
FROM 
	bigquery-public-data.google_trends.international_top_terms
WHERE 
	week='2018-12-30'
ORDER BY 
	rank DESC
LIMIT 5

-- Aggregation and filtering task to find the average score for all terms in designated week and DMA
SELECT 
	dma_id, dma_name, week, AVG(score) AS avg_score
FROM 
	bigquery-public-data.google_trends.top_terms
WHERE 
	dma_name='Marquette MI' AND week='2019-04-21'
GROUP BY 
	dma_id, dma_name, week

-- Identifying the term with the highest percent gain in the top_rising_terms table for the most recent week available in the dataset, first time using a subquery
SELECT 
	week, term, MAX(percent_gain) as highest_perc_incr_term
FROM 
	bigquery-public-data.google_trends.top_rising_terms
WHERE week = (
  SELECT MAX(week)
FROM bigquery-public-data.google_trends.top_rising_terms
)
GROUP BY
	week, term
ORDER BY 
	highest_perc_incr_term DESC
LIMIT 1

--Comparing the total score of terms in the international_top_rising_terms table between two countries over a specific month.
SELECT 
	country_name, MAX(score) as max_score
FROM 
	bigquery-public-data.google_trends.international_top_rising_terms
WHERE 
	country_name IN ('Netherlands','Canada')
GROUP BY 
	country_name

-- Expanding on the above, I modified the query to calculate the average between the two countries
SELECT 
	country_name, AVG(score) as avg_score
FROM 
	bigquery-public-data.google_trends.international_top_rising_terms
WHERE 
	country_name IN ('Netherlands','Canada')
GROUP BY 
	country_name

-- Further expansion, showing the average scores for all countries and adding limits
SELECT 
	country_name, AVG(score) as avg_score
FROM 
	bigquery-public-data.google_trends.international_top_rising_terms
GROUP BY 
	country_name
ORDER BY 
	avg_score DESC

SELECT 
	country_name, AVG(score) as avg_score
FROM 
	bigquery-public-data.google_trends.international_top_rising_terms
GROUP BY 
	country_name
ORDER BY 
	avg_score DESC
LIMIT 5

--First time using JOINs, it was ugly, took multiple revisions and guidance from GPT - not the greatest but now will focus learning on JOINS
SELECT 
	tt_table.dma_name,
	tt_table.term,
	tt_table.week,
	tt_table.score AS tt_score,
	tt2_table.score AS tt2_score
FROM 
	bigquery-public-data.google_trends.top_rising_terms AS tt_table
INNER JOIN 
	bigquery-public-data.google_trends.top_terms AS tt2_table
ON
	tt_table.dma_name = tt2_table.dma_name
	AND tt_table.term = tt2_table.term
	AND tt_table.week = tt2_table.week
WHERE 
	tt_table.dma_name = 'Portland-Auburn ME'
ORDER BY 
	tt_score DESC
LIMIT 5

-- Opted for a more simple JOIN challenge and was more confident with the query construction
SELECT
	a.dma_name,
	a.week,
	a.term
FROM 
	bigquery-public-data.google_trends.top_terms AS a
INNER JOIN 
	bigquery-public-data.google_trends.top_rising_terms AS b
ON
	a.dma_name = b.dma_name
	AND a.week = b.week
	AND a.term = b.term
WHERE 
	a.dma_name = 'Charlotte NC'
LIMIT 5

-- This was a fun one. The original objective was to find matching terms and scores for the United States in the international_top_terms and international_top_rising_terms tables. 
When the query returned no results, I used SELECT DISTINCT country_name to list all the country names in the dataset. The United States was not present in the data set, so I used the United Kingdom instead! 
SELECT
 tt.week, tt.term, tt.score, tt.country_name
FROM 
  bigquery-public-data.google_trends.international_top_rising_terms AS tt
LEFT JOIN 
  bigquery-public-data.google_trends.international_top_terms AS tt2
ON
  tt.week = tt2.week AND tt.term = tt2.term AND tt.country_name = tt2.country_name
WHERE
  tt.country_name = 'United Kingdom'
ORDER BY
  tt.week DESC
LIMIT 5

-- Multiple JOINS!
SELECT
 tt.week, tt.term, tt.refresh_date
FROM 
  bigquery-public-data.google_trends.international_top_rising_terms AS tt
  LEFT JOIN 
    bigquery-public-data.google_trends.international_top_terms AS tt2
    ON tt.week = tt2.week AND tt.term = tt2.term AND tt.refresh_date = tt2.refresh_date
  LEFT JOIN bigquery-public-data.google_trends.top_rising_terms AS tt3 
    ON tt.week = tt3.week AND tt.term = tt3.term AND tt.refresh_date = tt3.refresh_date
  LEFT JOIN bigquery-public-data.google_trends.top_terms AS tt4
    ON tt.week = tt4.week AND tt.term = tt4.term AND tt.refresh_date = tt4.refresh_date
ORDER BY
  tt.week DESC
LIMIT 5
