-- This file contains sample SQL queries used for analysis and the script to create the weather_data table used in this project.


-- This table stores weather readings collected from the OpenWeatherMap API using the python script in this repo.
CREATE TABLE weather_data (
    reading_id SERIAL PRIMARY KEY,
    city VARCHAR(50),
    country VARCHAR(50),
    reading_timestamp TIMESTAMP WITH TIME ZONE,
    temp_celsius NUMERIC(5, 2),
    total_precip NUMERIC(5, 2),
    weather_conditions VARCHAR(100)
);

-- These queries demonstrate how to extract key insights from the collected weather data.
-- Query 1: Find the highest and lowest temperature recorded for a specific city (e.g., Seattle)
SELECT
    MAX(temp_celsius) AS highest_temp,
    MIN(temp_celsius) AS lowest_temp
FROM
    weather_data
WHERE
    city = 'Seattle';

-- Query 2: Calculate the average temperature for each city and order them from warmest to coldest
-- This is the query that powers the "City Comparison" bar chart in the Tableau dashboard.
SELECT
    city,
    AVG(temp_celsius) AS average_temperature
FROM
    weather_data
GROUP BY
    city
ORDER BY
    average_temperature DESC;

-- Query 3: Find the total precipitation for each city
SELECT
    city,
    SUM(total_precip) AS total_precipitation_mm
FROM
    weather_data
GROUP BY
    city
ORDER BY
    total_precipitation_mm DESC;

-- Query 4: Select all readings where there was any precipitation
SELECT
    *
FROM
    weather_data
WHERE
    total_precip > 0;
