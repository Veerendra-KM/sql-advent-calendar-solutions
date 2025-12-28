-- SQL Advent Calendar - Day 4
-- Title: Energy-Efficient Holiday Decorations
-- Difficulty: easy
--
-- Question:
-- Kevin's trying to decorate the house without sending the electricity bill through the roof. Write a query to find the top 5 most energy-efficient decorations (i.e. lowest cost per hour to operate).
--
-- Kevin's trying to decorate the house without sending the electricity bill through the roof. Write a query to find the top 5 most energy-efficient decorations (i.e. lowest cost per hour to operate).
--

-- Table Schema:
-- Table: hall_decorations
--   decoration_id: INT
--   decoration_name: VARCHAR
--   energy_cost_per_hour: DECIMAL
--

-- My Solution:

SELECT
    decoration_id,
    decoration_name,
    energy_cost_per_hour
FROM hall_decorations
ORDER BY energy_cost_per_hour ASC
LIMIT 5;
