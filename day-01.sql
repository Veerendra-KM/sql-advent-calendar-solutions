-- SQL Advent Calendar - Day 1
-- Title: Reindeer Run - Find the Top 7
-- Difficulty: easy
--
-- Question:
-- Every year, the city of Whoville conducts a Reindeer Run to find the best reindeers for Santa's Sleigh. Write a query to return the name and rank of the top 7 reindeers in this race.
--
-- Every year, the city of Whoville conducts a Reindeer Run to find the best reindeers for Santa's Sleigh. Can you write a query to return the name and rank of the top 7 reindeers in this race?
--

-- Table Schema:
-- Table: reindeer_run_results
--   number: INTEGER
--   name: VARCHAR
--   rank: INTEGER
--   color: VARCHAR
--

-- My Solution:

SELECT name, rank
FROM reindeer_run_results
WHERE rank <= 7
ORDER BY rank;
