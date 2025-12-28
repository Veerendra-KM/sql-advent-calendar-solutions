-- SQL Advent Calendar - Day 16
-- Title: Cozy Snow Day Tasks
-- Difficulty: easy
--
-- Question:
-- It's a snow day, and Buddy is deciding which tasks he can do from under a blanket. Can you find all tasks that are either marked as 'Work From Home' or 'Low Priority' so he can stay cozy and productive?
--
-- It's a snow day, and Buddy is deciding which tasks he can do from under a blanket. Can you find all tasks that are either marked as 'Work From Home' or 'Low Priority' so he can stay cozy and productive?
--

-- Table Schema:
-- Table: daily_tasks
--   task_id: INTEGER
--   task_name: VARCHAR
--   task_type: VARCHAR
--   priority: VARCHAR
--

-- My Solution:

SELECT
    task_id,
    task_name,
    task_type,
    priority
FROM daily_tasks
WHERE task_type = 'Work From Home'
   OR priority = 'Low'
ORDER BY task_id;
