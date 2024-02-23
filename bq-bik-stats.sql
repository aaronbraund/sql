-- counting the number of bikes that ended at Moor Street, Soho during the Google Data analysis course
SELECT COUNT(bike_id) AS bike_count
FROM bigquery-public-data.london_bicycles.cycle_hire
WHERE end_station_name='Moor Street, Soho'

--counting number of bike session over 40 minutes long during the Google Data analysis course
SELECT COUNT (DISTINCT bike_id) as bike_session_40
FROM bigquery-public-data.london_bicycles.cycle_hire
WHERE duration >= 2400
