# SQL Advent Calendar 2024
This repository contains my solutions to Interview Master's 24-day SQL Advent Calendar challenge.
## About the Challenge
The SQL Advent Calendar is a festive coding challenge featuring 24 days of SQL problems, hosted by Interview Master.
Learn more at [interviewmaster.ai/advent](https://www.interviewmaster.ai/advent)
‎day-01.sql‎
+24
Lines changed: 24 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,24 @@
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
‎day-02.sql‎
+30
Lines changed: 30 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,30 @@
-- SQL Advent Calendar - Day 2
-- Title: Toys Delivered - Find Which Toys Made It
-- Difficulty: medium
--
-- Question:
-- Santa wants to analyze which toys that were produced in his workshop have already been delivered to children. You are given two tables on toy production and toy delivery — can you return the toy_id of the toys that have been delivered?
--
-- Santa wants to analyze which toys that were produced in his workshop have already been delivered to children. You are given two tables on toy production and toy delivery — can you return the toy ID and toy name of the toys that have been delivered?
--
-- Table Schema:
-- Table: toy_production
--   toy_id: INTEGER
--   toy_name: VARCHAR
--   production_date: DATE
--
-- Table: toy_delivery
--   toy_id: INTEGER
--   child_name: VARCHAR
--   delivery_date: DATE
--
-- My Solution:
SELECT 
    tp.toy_id,
    tp.toy_name
FROM toy_production tp
INNER JOIN toy_delivery td
    ON tp.toy_id = td.toy_id;
‎day-03.sql‎
+41
Lines changed: 41 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,41 @@
-- SQL Advent Calendar - Day 3
-- Title: The Grinch's Best Pranks Per Target
-- Difficulty: hard
--
-- Question:
-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.
--
-- The Grinch has brainstormed a ton of pranks for Whoville, but he only wants to keep the top prank per target, with the highest evilness score. Return the most evil prank for each target. If two pranks have the same evilness, the more recently brainstormed wins.
--
-- Table Schema:
-- Table: grinch_prank_ideas
--   prank_id: INTEGER
--   target_name: VARCHAR
--   prank_description: VARCHAR
--   evilness_score: INTEGER
--   created_at: TIMESTAMP
--
-- My Solution:
SELECT
    prank_id,
    target_name,
    prank_description,
    evilness_score,
    created_at
FROM (
    SELECT
        prank_id,
        target_name,
        prank_description,
        evilness_score,
        created_at,
        ROW_NUMBER() OVER (
            PARTITION BY target_name
            ORDER BY evilness_score DESC, created_at DESC
        ) AS rn
    FROM grinch_prank_ideas
) ranked_pranks
WHERE rn = 1;
‎day-04.sql‎
+26
Lines changed: 26 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,26 @@
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
‎day-05.sql‎
+33
Lines changed: 33 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,33 @@
-- SQL Advent Calendar - Day 5
-- Title: Elf Vacation Status
-- Difficulty: medium
--
-- Question:
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
--
-- Some elves took time off after the holiday rush, but not everyone has returned to work. List all elves by name, showing their return date. If they have not returned from vacation, list their return date as "Still resting".
--
-- Table Schema:
-- Table: elves
--   elf_id: INT
--   elf_name: VARCHAR
--
-- Table: vacations
--   elf_id: INT
--   start_date: DATE
--   return_date: DATE
--
-- My Solution:
SELECT
    e.elf_name,
    COALESCE(
        TO_CHAR(v.return_date, 'YYYY-MM-DD'),
        'Still resting'
    ) AS return_status
FROM elves e
LEFT JOIN vacations v
    ON e.elf_id = v.elf_id
ORDER BY e.elf_name;
‎day-06.sql‎
+35
Lines changed: 35 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,35 @@
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
‎day-07.sql‎
+24
Lines changed: 24 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,24 @@
-- SQL Advent Calendar - Day 7
-- Title: Snowflake Types Count
-- Difficulty: easy
--
-- Question:
-- Frosty wants to know how many unique snowflake types were recorded on the December 24th, 2025 storm. Can you help him?
--
-- Frosty wants to know how many unique snowflake types were recorded on the December 24th, 2025 storm. Can you help him?
--
-- Table Schema:
-- Table: snowfall_log
--   flake_id: INT
--   flake_type: VARCHAR
--   fall_time: TIMESTAMP
--
-- My Solution:
SELECT
    COUNT(DISTINCT flake_type) AS unique_flake_types
FROM snowfall_log
WHERE fall_time >= '2025-12-24 00:00:00'
  AND fall_time <  '2025-12-25 00:00:00';
‎day-08.sql‎
+33
Lines changed: 33 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,33 @@
-- SQL Advent Calendar - Day 8
-- Title: Storage Room Inventory
-- Difficulty: medium
--
-- Question:
-- Mrs. Claus is organizing the holiday storage room and wants a single list of all decorations — both Christmas trees and light sets. Write a query that combines both tables and includes each item's name and category.
--
-- Mrs. Claus is organizing the holiday storage room and wants a single list of all decorations — both Christmas trees and light sets. Write a query that combines both tables and includes each item's name and category.
--
-- Table Schema:
-- Table: storage_trees
--   item_name: VARCHAR
--   category: VARCHAR
--
-- Table: storage_lights
--   item_name: VARCHAR
--   category: VARCHAR
--
-- My Solution:
SELECT
    item_name,
    category
FROM storage_trees
UNION ALL
SELECT
    item_name,
    category
FROM storage_lights;
‎day-09.sql‎
+29
Lines changed: 29 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,29 @@
-- SQL Advent Calendar - Day 9
-- Title: Tinsel and Light Combinations
-- Difficulty: hard
--
-- Question:
-- The elves are testing new tinsel–light combinations to find the next big holiday trend. Write a query to generate every possible pairing of tinsel colors and light colors, include in your output a column that combines the two values separated with a dash ("-").
--
-- The elves are testing new tinsel–light combinations to find the next big holiday trend. Write a query to generate every possible pairing of tinsel colors and light colors, include in your output a column that combines the two values separated with a dash ("-"). 
--
-- Table Schema:
-- Table: tinsel_colors
--   tinsel_id: INT
--   color_name: VARCHAR
--
-- Table: light_colors
--   light_id: INT
--   color_name: VARCHAR
--
-- My Solution:
SELECT
    t.color_name AS tinsel_color,
    l.color_name AS light_color,
    t.color_name || '-' || l.color_name AS tinsel_light_combo
FROM tinsel_colors t
CROSS JOIN light_colors l
ORDER BY t.color_name, l.color_name;
‎day-10.sql‎
+25
Lines changed: 25 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,25 @@
-- SQL Advent Calendar - Day 10
-- Title: Cookie Factory Oven Efficiency
-- Difficulty: easy
--
-- Question:
-- In the holiday cookie factory, workers are measuring how efficient each oven is. Can you find the average baking time per oven rounded to one decimal place?
--
-- In the holiday cookie factory, workers are measuring how efficient each oven is. Can you find the average baking time per oven rounded to one decimal place?
--
-- Table Schema:
-- Table: cookie_batches
--   batch_id: INT
--   oven_id: INT
--   baking_time_minutes: DECIMAL
--
-- My Solution:
SELECT
    oven_id,
    ROUND(AVG(baking_time_minutes), 1) AS avg_baking_time_minutes
FROM cookie_batches
GROUP BY oven_id
ORDER BY oven_id;
‎day-11.sql‎
+24
Lines changed: 24 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,24 @@
-- SQL Advent Calendar - Day 11
-- Title: Winter Market Sweater Search
-- Difficulty: medium
--
-- Question:
-- At the winter market, Cindy Lou is browsing the clothing inventory and wants to find all items with "sweater" in their name. But the challenge is the color and item columns have inconsistent capitalization. Can you write a query to return only the sweater names and their cleaned-up colors.
--
-- At the winter market, Cindy Lou is browsing the clothing inventory and wants to find all items with "sweater" in their name. But the challenge is the color and item columns have inconsistent capitalization. Can you write a query to return only the sweater names and their cleaned-up colors.
--
-- Table Schema:
-- Table: winter_clothing
--   item_id: INT
--   item_name: VARCHAR
--   color: VARCHAR
--
-- My Solution:
SELECT
    item_name,
    INITCAP(LOWER(color)) AS cleaned_color
FROM winter_clothing
WHERE LOWER(item_name) LIKE '%sweater%';
‎day-12.sql‎
+53
Lines changed: 53 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,53 @@
-- SQL Advent Calendar - Day 12
-- Title: North Pole Network Most Active Users
-- Difficulty: hard
--
-- Question:
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- The North Pole Network wants to see who's the most active in the holiday chat each day. Write a query to count how many messages each user sent, then find the most active user(s) each day. If multiple users tie for first place, return all of them.
--
-- Table Schema:
-- Table: npn_users
--   user_id: INT
--   user_name: VARCHAR
--
-- Table: npn_messages
--   message_id: INT
--   sender_id: INT
--   sent_at: TIMESTAMP
--
-- My Solution:
WITH daily_counts AS (
    SELECT
        DATE(m.sent_at) AS chat_date,
        u.user_id,
        u.user_name,
        COUNT(*) AS message_count
    FROM npn_messages m
    JOIN npn_users u
        ON m.sender_id = u.user_id
    GROUP BY DATE(m.sent_at), u.user_id, u.user_name
),
ranked_activity AS (
    SELECT
        chat_date,
        user_id,
        user_name,
        message_count,
        RANK() OVER (
            PARTITION BY chat_date
            ORDER BY message_count DESC
        ) AS activity_rank
    FROM daily_counts
)
SELECT
    chat_date,
    user_name,
    message_count
FROM ranked_activity
WHERE activity_rank = 1
ORDER BY chat_date, user_name;
‎day-13.sql‎
+23
Lines changed: 23 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,23 @@
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
‎day-14.sql‎
+26
Lines changed: 26 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,26 @@
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
‎day-15.sql‎
+26
Lines changed: 26 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,26 @@
-- SQL Advent Calendar - Day 15
-- Title: The Grinch's Mischief Tracker
-- Difficulty: hard
--
-- Question:
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--
-- The Grinch is tracking his daily mischief scores to see how his behavior changes over time. Can you find how many points his score increased or decreased each day compared to the previous day?
--
-- Table Schema:
-- Table: grinch_mischief_log
--   log_date: DATE
--   mischief_score: INTEGER
--
-- My Solution:
SELECT
    log_date,
    mischief_score,
    mischief_score 
      - LAG(mischief_score) OVER (ORDER BY log_date) 
        AS daily_score_change
FROM grinch_mischief_log
ORDER BY log_date;
‎day-16.sql‎
+29
Lines changed: 29 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,29 @@
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
‎day-17.sql‎
+29
Lines changed: 29 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,29 @@
-- SQL Advent Calendar - Day 17
-- Title: Evening Task Categories
-- Difficulty: medium
--
-- Question:
-- During a quiet evening of reflection, Cindy Lou wants to categorize her tasks based on how peaceful they are. Can you write a query that adds a new column classifying each task as 'Calm' if its noise_level is below 50, and 'Chaotic' otherwise?
--
-- During a quiet evening of reflection, Cindy Lou wants to categorize her tasks based on how peaceful they are. Can you write a query that adds a new column classifying each task as 'Calm' if its noise_level is below 50, and 'Chaotic' otherwise?
--
-- Table Schema:
-- Table: evening_tasks
--   task_id: INTEGER
--   task_name: VARCHAR
--   noise_level: INTEGER
--
-- My Solution:
SELECT
    task_id,
    task_name,
    noise_level,
    CASE
        WHEN noise_level < 50 THEN 'Calm'
        ELSE 'Chaotic'
    END AS task_mood
FROM evening_tasks
ORDER BY task_id;
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
‎day-19.sql‎
+27
Lines changed: 27 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,27 @@
-- SQL Advent Calendar - Day 19
-- Title: Gift Wrap Paper Usage
-- Difficulty: easy
--
-- Question:
-- Clara is reviewing holiday orders to uncover hidden patterns — can you return the total amount of wrapping paper used for orders that were both gift-wrapped and successfully delivered?
--
-- Clara is reviewing holiday orders to uncover hidden patterns — can you return the total amount of wrapping paper used for orders that were both gift-wrapped and successfully delivered?
--
-- Table Schema:
-- Table: holiday_orders
--   order_id: INT
--   customer_name: VARCHAR
--   gift_wrap: BOOLEAN
--   paper_used_meters: DECIMAL
--   delivery_status: VARCHAR
--   order_date: DATE
--
-- My Solution:
SELECT 
    SUM(paper_used_meters) AS total_wrapping_paper_meters
FROM holiday_orders
WHERE gift_wrap = true
  AND delivery_status = 'Delivered';
‎day-20.sql‎
+44
Lines changed: 44 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,44 @@
-- SQL Advent Calendar - Day 20
-- Title: Hot Cocoa Break Logs
-- Difficulty: medium
--
-- Question:
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--
-- Jack Frost wants to review all the cocoa breaks he actually took — including the cocoa type and the location he drank it in. How would you combine the necessary tables to show each logged break with its matching cocoa details and location?
--
-- Table Schema:
-- Table: cocoa_logs
--   log_id: INT
--   break_id: INT
--   cocoa_id: INT
--
-- Table: break_schedule
--   break_id: INT
--   location_id: INT
--
-- Table: cocoa_types
--   cocoa_id: INT
--   cocoa_name: VARCHAR
--
-- Table: locations
--   location_id: INT
--   location_name: VARCHAR
--
-- My Solution:
SELECT
    cl.log_id,
    cl.break_id,
    ct.cocoa_name,
    l.location_name
FROM cocoa_logs cl
JOIN break_schedule bs
    ON cl.break_id = bs.break_id
JOIN cocoa_types ct
    ON cl.cocoa_id = ct.cocoa_id
JOIN locations l
    ON bs.location_id = l.location_id
ORDER BY cl.log_id;
‎day-21.sql‎
+27
Lines changed: 27 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,27 @@
-- SQL Advent Calendar - Day 21
-- Title: Fireside Story Running Total
-- Difficulty: hard
--
-- Question:
-- The Snow Queen hosts nightly fireside chats and records how many stories she tells each evening. Can you calculate the running total of stories she has shared over time, in the order they were told?
--
-- The Snow Queen hosts nightly fireside chats and records how many stories she tells each evening. Can you calculate the running total of stories she has shared over time, in the order they were told?
--
-- Table Schema:
-- Table: story_log
--   log_date: DATE
--   stories_shared: INT
--
-- My Solution:
SELECT
    log_date,
    stories_shared,
    SUM(stories_shared) OVER (
        ORDER BY log_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total_stories
FROM story_log
ORDER BY log_date;
‎day-22.sql‎
+25
Lines changed: 25 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,25 @@
-- SQL Advent Calendar - Day 22
-- Title: Penguin Sleigh Ride Filter
-- Difficulty: easy
--
-- Question:
-- The penguins are signing up for a community sleigh ride, but the organizers need a list of everyone who did NOT choose the "Evening Ride." How would you return all penguins whose selected time is not the evening slot?
--
-- The penguins are signing up for a community sleigh ride, but the organizers need a list of everyone who did NOT choose the "Evening Ride." How would you return all penguins whose selected time is not the evening slot?
--
-- Table Schema:
-- Table: sleigh_ride_signups
--   signup_id: INT
--   penguin_name: VARCHAR
--   ride_time: VARCHAR
--
-- My Solution:
SELECT
    signup_id,
    penguin_name,
    ride_time
FROM sleigh_ride_signups
WHERE ride_time <> 'Evening';
‎day-23.sql‎
+25
Lines changed: 25 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,25 @@
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
‎day-24.sql‎
+33
Lines changed: 33 additions & 0 deletions
Original file line number	Diff line number	Diff line change
@@ -0,0 +1,33 @@
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

