-- SQL Advent Calendar - Day 23
-- Title: Gingerbread House Top Builders
-- Difficulty: medium
--
-- Question:
-- The Gingerbread House Competition wants to feature the top 3 builders who used the most distinct candy types in their designs. How would you find the builders with the highest count of unique candies, and return only the top three?
--
-- The Gingerbread House Competition wants to feature the builders who used at least 4 distinct candy types in their designs. How would you identify these builders?
--

-- Table Schema:
-- Table: gingerbread_designs
--   builder_id: INT
--   builder_name: VARCHAR
--   candy_type: VARCHAR
--

-- My Solution:

SELECT
    builder_id,
    builder_name
FROM gingerbread_designs
GROUP BY builder_id, builder_name
HAVING COUNT(DISTINCT candy_type) >= 4;
