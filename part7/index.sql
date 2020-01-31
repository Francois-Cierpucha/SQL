--Exo1
USE webDevelopment;
SELECT * FROM `languages`;

--Exo2
SELECT `version`  FROM `languages` WHERE `language` = 'PHP';

--Exo3
--SELECT `version`,`language`  FROM `languages` WHERE `language` = 'PHP' OR `language` = 'JavaScript';
SELECT `version`,`language` FROM `languages` WHERE `language` IN ('PHP', 'JavaScript');

--Exo4
 --SELECT *  FROM `languages` WHERE `id` = 3 OR `id = 5 OR id = 7;
 SELECT *  FROM `languages` WHERE `id` IN (3,5,7);

--Exo5
 SELECT * FROM `languages` WHERE `language` = 'JavaScript' LIMIT 2;

--Exo6

SELECT * FROM `languages` WHERE `language` != 'PHP';
SELECT * FROM `languages` WHERE `language` <> 'PHP'; --<> différent de / sauf

--Exo7
SELECT * FROM `languages` ORDER BY `language` ASC; --ou DESC = descendant
