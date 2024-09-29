
--1. Trend Analysis: 
--  Average AQI by year and state
SELECT YEAR(Date) AS Year, state_name,
    AVG(CAST(AQI AS INT)) AS avg_aqi
FROM US_AQI
GROUP BY YEAR(Date), state_name
ORDER BY Year, avg_aqi DESC;

-- 2- Investigate Seasonality Patterns
 --  Average AQI by season
ALTER TABLE US_AQI
ADD Season VARCHAR(10);
UPDATE US_AQI
SET Season = CASE 
                WHEN MONTH(Date) IN (12, 1, 2) THEN 'Winter'
                WHEN MONTH(Date) IN (3, 4, 5) THEN 'Spring'
                WHEN MONTH(Date) IN (6, 7, 8) THEN 'Summer'
                WHEN MONTH(Date) IN (9, 10, 11) THEN 'Fall'
             END;

--Trend by Season and Year:
SELECT YEAR(Date) AS Year,  Season,  AVG(CAST(AQI AS INT)) AS avg_aqi
FROM 
    US_AQI
GROUP BY YEAR(Date), Season
ORDER BY  Year, Season;

----3. Regional Analysis (Top Polluted Regions)
-- Top 5 most polluted regions by 
SELECT TOP 5
    city_ascii, 
    state_name,
    AVG(CAST(AQI AS INT)) AS avg_aqi
FROM 
    US_AQI
GROUP BY 
    city_ascii, state_name
ORDER BY 
    avg_aqi DESC;

Select * from US_AQI

----4. Correlations Between Pollutants
--This query provides the average AQI by different pollutants (represented by the "Defining Parameter" column).

SELECT 
    [Defining Parameter], 
    AVG(CAST(AQI AS INT)) AS avg_aqi, 
    COUNT(*) AS num_records 
FROM 
    US_AQI
GROUP BY 
    [Defining Parameter] 
ORDER BY 
    avg_aqi DESC;

	---5. Health and Policy Impact
-- 5. Comparing AQI before and after policy changes (e.g., Clean Air Act Amendments in 1990)
SELECT 
    CASE 
        WHEN YEAR(Date) < 1990 THEN 'Before 1990'
        ELSE 'After 1990'
    END AS Period,
    state_name,
    AVG(CAST(AQI AS INT)) AS avg_aqi
FROM 
    US_AQI
GROUP BY 
    Period, state_name
ORDER BY 
    avg_aqi DESC;

-----------------------------------------------------------------
	SELECT 
    CASE 
        WHEN YEAR(CAST(Date AS DATE)) < 1990 THEN 'Before 1990'
        ELSE 'After 1990'
    END AS Period,
    state_name,
    AVG(CAST(AQI AS INT)) AS avg_aqi
FROM 
    US_AQI
GROUP BY 
    CASE 
        WHEN YEAR(CAST(Date AS DATE)) < 1990 THEN 'Before 1990'
        ELSE 'After 1990'
    END,
    state_name
ORDER BY 
    avg_aqi DESC;


---------------Aggregation


CREATE TABLE US_AQI_aggregated (
Year INT, 
state_name VARCHAR(255), 
Season VARCHAR(10), 
Category VARCHAR(50),
Defining_Parameter VARCHAR(255), 
avg_aqi FLOAT, 
avg_population_density FLOAT, 
avg_sites_reporting FLOAT, 
num_records INT
);

INSERT INTO US_AQI_aggregated (Year, state_name, Season, Category, Defining_Parameter, avg_aqi, avg_population_density, avg_sites_reporting, num_records)
SELECT 
    YEAR(Date) AS Year, 
    state_name, 
    Season, 
	Category,
    [Defining Parameter], 
    CAST(ROUND(AVG(CAST(AQI AS FLOAT)), 0) AS INT) AS avg_aqi,  -- Rounding avg AQI to 0 decimal places and converting to INT
    CAST(MAX(CAST(REPLACE(density, '.0', '') AS INT)) AS INT) AS population_density,  -- Removing decimals and casting as INT
    CAST(MAX(CAST(REPLACE([Number of Sites Reporting], '.0', '') AS INT)) AS INT) AS sites_reporting,  -- Removing decimals and casting as INT
    COUNT(*) AS num_records  -- Count of records
FROM 
    US_AQI
GROUP BY 
    YEAR(Date), state_name, Season, [Defining Parameter], Category  -- Added Category to GROUP BY
ORDER BY 
    Year ASC;


SELECT * 
FROM US_AQI_aggregated
WHERE Category LIKE 'Hazardous%';  -- This will match 'Hazardous' and any value that starts with it


Select * from US_AQI_aggregated



----State Performance Analysis: Historical and Future Trends


SELECT 
    Year, 
    state_name, 
    AVG(avg_aqi) AS avg_aqi_per_year
FROM 
    US_AQI_aggregated
GROUP BY 
    Year, state_name
ORDER BY 
    Year ASC;


------Calculate Yearly Percentage Change

SELECT 
    state_name,
    Year, 
    avg_aqi_per_year,
    LAG(avg_aqi_per_year, 1) OVER (PARTITION BY state_name ORDER BY Year) AS prev_aqi, 
    ROUND((avg_aqi_per_year - LAG(avg_aqi_per_year, 1) OVER (PARTITION BY state_name ORDER BY Year)) / LAG(avg_aqi_per_year, 1) OVER (PARTITION BY state_name ORDER BY Year) * 100, 2) AS aqi_percentage_change
FROM (
    SELECT 
        Year, 
        state_name, 
        AVG(avg_aqi) AS avg_aqi_per_year
    FROM 
        US_AQI_aggregated
    GROUP BY 
        Year, state_name
) AS yearly_trend
ORDER BY Year ASC;


Select DISTINCT state_name from US_AQI_aggregated

Select *from US_AQI_aggregated