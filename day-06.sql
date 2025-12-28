-- SQL Advent Calendar - Day 6
-- Title: Ski Resort Snowfall Rankings
-- Difficulty: hard
--
-- Question:
-- Buddy is planning a winter getaway and wants to rank ski resorts by annual snowfall. Can you help him bucket these ski resorts into quartiles?
--
-- Buddy is planning a winter getaway and wants to rank ski resorts by annual snowfall. Can you help him bucket these ski resorts into quartiles?
--

-- Table Schema:
-- Table: resort_monthly_snowfall
--   resort_id: INT
--   resort_name: VARCHAR
--   snow_month: INT
--   snowfall_inches: DECIMAL
--

-- My Solution:

WITH annual_snowfall AS (
    SELECT
        resort_id,
        resort_name,
        SUM(snowfall_inches) AS annual_snowfall_inches
    FROM resort_monthly_snowfall
    GROUP BY resort_id, resort_name
)
SELECT
    resort_id,
    resort_name,
    annual_snowfall_inches,
    NTILE(4) OVER (ORDER BY annual_snowfall_inches DESC) AS snowfall_quartile
FROM annual_snowfall
ORDER BY annual_snowfall_inches DESC;
