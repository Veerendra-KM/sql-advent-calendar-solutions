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
