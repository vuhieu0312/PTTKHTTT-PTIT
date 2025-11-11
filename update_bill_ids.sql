-- Script to update bill IDs to make them non-sequential for realistic data
-- Database: cinemadb
-- Purpose: Make bill IDs scattered instead of sequential for the same client

USE cinemadb;

-- Temporarily disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- Update bill IDs for Client 4 to make them non-sequential
-- Changing IDs: 41->41, 42->58, 43->67, 44->89, 45->102, 46->115

-- Step 1: Move to temporary IDs first to avoid conflicts
UPDATE bill SET id = 1041 WHERE id = 41;
UPDATE bill SET id = 1042 WHERE id = 42;
UPDATE bill SET id = 1043 WHERE id = 43;
UPDATE bill SET id = 1044 WHERE id = 44;
UPDATE bill SET id = 1045 WHERE id = 45;
UPDATE bill SET id = 1046 WHERE id = 46;

-- Step 2: Update to final non-sequential IDs
UPDATE bill SET id = 41 WHERE id = 1041;   -- 03/10/2025 - keep original
UPDATE bill SET id = 58 WHERE id = 1042;   -- 11/10/2025 - gap of 17
UPDATE bill SET id = 67 WHERE id = 1043;   -- 18/10/2025 - gap of 9
UPDATE bill SET id = 89 WHERE id = 1044;   -- 24/10/2025 - gap of 22
UPDATE bill SET id = 102 WHERE id = 1045;  -- 02/11/2025 - gap of 13
UPDATE bill SET id = 115 WHERE id = 1046;  -- 06/11/2025 - gap of 13

-- Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- Verify the changes
SELECT id, date, total, ClientId 
FROM bill 
WHERE ClientId = 4 
ORDER BY date;
