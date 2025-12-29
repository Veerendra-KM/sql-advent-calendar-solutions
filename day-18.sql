-- SQL Advent Calendar - Day 18
-- Title: 12 Days of Data - Progress Tracking
-- Difficulty: hard
--
-- Question:
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--
-- Over the 12 days of her data challenge, Data Dawn tracked her daily quiz scores across different subjects. Can you find each subject's first and last recorded score to see how much she improved?
--

-- Table Schema:
-- Table: daily_quiz_scores
--   subject: VARCHAR
--   quiz_date: DATE
--   score: INTEGER
--

-- My Solution:

SELECT
    subject,
    (SELECT score 
     FROM daily_quiz_scores dq1 
     WHERE dq1.subject = dq.subject 
     ORDER BY quiz_date ASC 
     LIMIT 1) AS first_score,
    (SELECT score 
     FROM daily_quiz_scores dq2 
     WHERE dq2.subject = dq.subject 
     ORDER BY quiz_date DESC 
     LIMIT 1) AS last_score
FROM daily_quiz_scores dq
GROUP BY subject
ORDER BY subject;
