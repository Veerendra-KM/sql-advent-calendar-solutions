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
