-- SQL Advent Calendar - Day 24
-- Title: New Year Goals - User Type Analysis
-- Difficulty: hard
--
-- Question:
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--
-- As the New Year begins, the goals tracker team wants to understand how user types differ. How many completed goals does the average user have in each user_type?
--

-- Table Schema:
-- Table: user_goals
--   user_id: INT
--   user_type: VARCHAR
--   goal_id: INT
--   goal_status: VARCHAR
--

-- My Solution:

SELECT
    user_type,
    AVG(completed_goals) AS avg_completed_goals
FROM (
    SELECT
        user_id,
        user_type,
        COUNT(*) AS completed_goals
    FROM user_goals
    WHERE goal_status = 'Completed'
    GROUP BY user_id, user_type
) t
GROUP BY user_type;
