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
