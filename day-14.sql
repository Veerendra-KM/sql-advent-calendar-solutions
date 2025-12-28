-- SQL Advent Calendar - Day 14
-- Title: Focus Challenge End Dates
-- Difficulty: medium
--
-- Question:
-- The Productivity Club is tracking members' challenge start dates and wants to calculate each member's focus_end_date, exactly 14 days after their start date. Can you write a query to return the existing table with the focus_end_date column?
--
-- The Productivity Club is tracking members' challenge start dates and wants to calculate each member's focus_end_date, exactly 14 days after their start date. Can you write a query to return the existing table with the focus_end_date column?
--

-- Table Schema:
-- Table: focus_challenges
--   member_id: INTEGER
--   member_name: VARCHAR
--   start_date: DATE
--

-- My Solution:

SELECT
    member_id,
    member_name,
    start_date,
    start_date + INTERVAL '14 day' AS focus_end_date
FROM focus_challenges
ORDER BY member_id;
