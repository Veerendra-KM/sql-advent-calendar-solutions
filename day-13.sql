-- SQL Advent Calendar - Day 13
-- Title: Naughty or Nice Score Extremes
-- Difficulty: easy
--
-- Question:
-- Santa's audit team is reviewing this year's behavior scores to find the extremes — write a query to return the lowest and highest scores recorded on the Naughty or Nice list.
--
-- Santa's audit team is reviewing this year's behavior scores to find the extremes — write a query to return the lowest and highest scores recorded on the Naughty or Nice list.
--

-- Table Schema:
-- Table: behavior_scores
--   record_id: INTEGER
--   child_name: VARCHAR
--   behavior_score: INTEGER
--

-- My Solution:

SELECT
    MIN(behavior_score) AS lowest_score,
    MAX(behavior_score) AS highest_score
FROM behavior_scores;
