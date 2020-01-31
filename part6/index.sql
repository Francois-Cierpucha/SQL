SQL PARTIE 6
-------------------------------------
exo 1
SELECT * FROM `frameworks` WHERE `version` LIKE '2.%';
exo 2
SELECT * FROM `frameworks` WHERE `id` IN (1, 3);
exo 3
SELECT * FROM `ide` WHERE `date` >= '2010-01-01' AND `date` <= '2011-12-31';
