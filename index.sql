--Entrer dans mariaDB
mysql -u root -p

--Créer une base de donnée
CREATE DATABASE `nomDeLaBase`;

--creer une base de donnée en utf-8
CREATE DATABASE `nomDeLaBase` CHARATE SET 'utf8';

--creer une base de donnée si elle n''existe pas
CREATE DATABASE IF NOT EXISTS `nomDaLaBase`;

--suprimer une base de donnée
DROP DATABASE `nomDeLaBase`;

--suprimer une base de donnée
Drop DATABASE IF EXISTS `nomDeLaBase`;

--voir les bases de données
SHOW DATABASE `nomDeLaBase`;

--entrer dans une base de donnée
USE `nomDeLaBase`

--Creer un tableau
CREATE TABLE `nomDeLaBase` (
`id` INT AUTO_INCREMENT PRIMARY KEY,
tool VARVHAR(5)
);

--Creer un tableau si il n''existe pas
CREATE TABLE [IF NOT EXISTS] `nom` (
`id` INT AUTO_INCREMENT PRIMARY KEY,
tool VARVHAR(40) NOT NULL
);

--suprimer une table
DROP TABLE tools;

--suprimer si elle existe une table
DROP TABLE IF EXISTS TOOLS;

--exemple
CREATE TABLE utisateur
(
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(255),
    date_naissance DATE,
    pays VARCHAR(255),
    ville VARCHAR(255),
    code_postal VARCHAR(5),
    nombre_achat INT
) ENGINE = InnoDB ;

--pour un grand tableau
MariaDB [codex]> CREATE TABLE `clients`
(
 `id` INT AUTO_INCREMENT PRIMARY KEY,
 `lastname` VARCHAR(100),
 `firstname` VARCHAR(100),
 `birthDate` DATE,
 `address` VARCHAR(225),
 `firstPhoneNumber` INT,
 `secondPhoneNumber` INT,
 `mail` VARCHAR(255)
) ENGINE = InnoDB ;

--partie 3

--Execice1
ALTER TABLE `languages`
ADD `versions` VARCHAR(255);

--Exercice2
ALTER TABLE Customer MODIFY Addr char(30);

ALTER TABLE `languages`
ADD `versions` VARCHAR(255);

--Exercice3
MariaDB [webDevelopment]> ALTER TABLE `languages`
    -> CHANGE `versions` `version` VARCHAR(255);

--Exercice4
ALTER TABLE `frameworks` CHANGE `name` `framework` VARCHAR(40);

--Exercice5
MariaDB [webDevelopment]> ALTER TABLE `frameworks`
     ALTER COLUMN `version` VARCHAR(10)
    -> ;

--TP
USE codex;
ALTER TABLE clients
    -> DROP secondPhoneNumber;
ALTER TABLE clients CHANGE firstPhoneNumber phoneNumber int(11);
ALTER TABLE `clients` MODIFY `phoneNumber` VARCHAR(55);
MariaDB [codex]> ALTER TABLE `clients`
    -> ADD zipCode VARCHAR(55);
MariaDB [codex]> ALTER TABLE `clients` ADD city VARCHAR(55);

--partie 4

--Exercice1
INSERT INTO `languages`
     (language, version)
     VALUES
     (`javaScript`, `version5`),
     ('PHP', 'version 5.2'),
     ('PHP', 'version 5.4'),
     ('HTML', 'version 5.1'),
     ('JavaScript', 'version 6'),
     ('JavaScript', 'version 7'),
     ('JavaScritp', 'version 8'),
     ('PHP', 'version 7');

--Exercice2
INSERT INTO `frameworks` (framework, version)
     VALUES
     ('Symfony', 'version 2.8'),
     ('Sympfony', 'version 3'),
     ('Jquery', 'version 1.6'),
     ('Jquery', 'version 2.10');

--Partie 5

--Ex1
MariaDB [webDevelopment]> SELECT * FROM languages;

--Ex2
SELECT * FROM `languages` WHERE `language` = 'PHP';

--Ex3
MariaDB [webDevelopment]> SELECT * FROM `languages` WHERE `language` = 'PHP' || `language` = 'JavaScript';

--Ex4
MariaDB [webDevelopment]> SELECT * FROM `languages` WHERE `id` = '3' || `id` = '5' || `id` = '7';
SELECT * FROM `languages` WHERE `id` IN (3,5,7);

--Ex5
MariaDB [webDevelopment]> Select *
    -> From languages
    -> LIMIT 2;

--Ex6
MariaDB [webDevelopment]> SELECT * FROM `languages` WHERE `language` NOT LIKE 'PHP';
SELECT * FROM `languages` WHERE `language` != 'PHP';
SELECT * FROM `languages` WHERE `language` <> 'PHP';

--Exo7
MariaDB [webDevelopment]> SELECT *
    -> FROM languages
    -> ORDER BY `language` ASC;

--Part 6

CREATE TABLE `webDevelopment`.`ide` (
`id` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
`version` VARCHAR(10) NOT NULL,
`date` DATE NOT NULL,
PRIMARY KEY (`id`)
)
ENGINE=INNODB;

INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.3', '2007-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.5', '2009-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.6', '2010-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '3.7', '2011-06-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('Eclipse', '4.3', '2013-06-13');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('NetBeans', '7', '2011-04-01');
INSERT INTO `webDevelopment`.`ide` (`name`, `version`, `date`) VALUES ('NetBeans', '8.2', '2016-10-03');

--Ex1

MariaDB [webDevelopment]> SELECT * FROM `frameworks` WHERE `version` LIKE 'version 2.%' ;

--Ex2

MariaDB [webDevelopment]> SELECT * FROM `frameworks` WHERE `id` = '1' || `id` = '3';
SELECT * FROM `frameworks` WHERE `id` IN (1, 3);

--Ex3

MariaDB [webDevelopment]> SELECT * FROM `ide` WHERE `date` > '2010-01-01' && `date` < '2011-12-31';
SELECT * FROM `ide` WHERE `date` BETWEEN '2010-01-01' AND '2011-12-31';

--Part 7

--ex1

MariaDB [webDevelopment]> DELETE FROM `languages`
    -> WHERE `language` = HTML;

--ex2

MariaDB [webDevelopment]> UPDATE `frameworks` SET framework = 'Symfony 2' WHERE framework = 'Symfony';

--ex3

 UPDATE `languages` SET `version` = 'version 5.1' WHERE `language` = 'JavaScript' AND `version` = 'version 5';

--Part 8

-- ex1

SELECT DISTINCT * FROM `languages` LEFT JOIN `frameworks` ON `languagesId` = `languages`.`id`;
+----+------------+------+---------------+-------------+
| id | name       | id   | name          | languagesId |
+----+------------+------+---------------+-------------+
|  3 | C++        |    1 | Qt            |           3 |
|  4 | Java       |    2 | SDK Android   |           4 |
|  6 | CSS        |    3 | Bootstrap     |           6 |
|  6 | CSS        |    4 | Foundation    |           6 |
|  6 | CSS        |    5 | KNACSS        |           6 |
|  6 | CSS        |    6 | Avalanche     |           6 |
|  6 | CSS        |    7 | Miligram      |           6 |
|  6 | CSS        |    8 | Skeleton      |           6 |
|  6 | CSS        |    9 | Hoisin        |           6 |
|  6 | CSS        |   10 | Inuit         |           6 |
|  6 | CSS        |   11 | Mimic         |           6 |
|  6 | CSS        |   12 | Ministrap     |           6 |
|  6 | CSS        |   13 | Lotus         |           6 |
|  7 | JavaScript |   14 | Jquery        |           7 |
|  7 | JavaScript |   15 | Angular       |           7 |
|  7 | JavaScript |   16 | ReactJS       |           7 |
|  7 | JavaScript |   17 | Vue.js        |           7 |
|  7 | JavaScript |   18 | Ember.js      |           7 |
|  7 | JavaScript |   19 | Meteor.js     |           7 |
|  8 | PHP        |   20 | Laravel       |           8 |
|  8 | PHP        |   21 | Symfony       |           8 |
|  8 | PHP        |   22 | CodeIgniter   |           8 |
|  8 | PHP        |   23 | Yii           |           8 |
|  8 | PHP        |   24 | Phalcon       |           8 |
|  8 | PHP        |   25 | Lumen         |           8 |
|  8 | PHP        |   26 | Silex         |           8 |
|  8 | PHP        |   27 | Slim          |           8 |
|  9 | C#         |   28 | .NET          |           9 |
| 10 | VB         |   29 | .NET          |          10 |
| 11 | Python     |   30 | Django        |          11 |
| 12 | Ruby       |   31 | Ruby On Rails |          12 |
|  1 | Assembleur | NULL | NULL          |        NULL |
|  2 | C          | NULL | NULL          |        NULL |
|  5 | HTML       | NULL | NULL          |        NULL |
| 13 | Swift      | NULL | NULL          |        NULL |
+----+------------+------+---------------+-------------+

-- Ex2

SELECT DISTINCT * FROM `frameworks` INNER JOIN `languages` ON `languagesId` = `languages`.`id`;
--WHERE `languagesId` IS NULL
--OR `languages`.`id` IS NULL;
+----+---------------+-------------+----+------------+
| id | name          | languagesId | id | name       |
+----+---------------+-------------+----+------------+
|  1 | Qt            |           3 |  3 | C++        |
|  2 | SDK Android   |           4 |  4 | Java       |
|  3 | Bootstrap     |           6 |  6 | CSS        |
|  4 | Foundation    |           6 |  6 | CSS        |
|  5 | KNACSS        |           6 |  6 | CSS        |
|  6 | Avalanche     |           6 |  6 | CSS        |
|  7 | Miligram      |           6 |  6 | CSS        |
|  8 | Skeleton      |           6 |  6 | CSS        |
|  9 | Hoisin        |           6 |  6 | CSS        |
| 10 | Inuit         |           6 |  6 | CSS        |
| 11 | Mimic         |           6 |  6 | CSS        |
| 12 | Ministrap     |           6 |  6 | CSS        |
| 13 | Lotus         |           6 |  6 | CSS        |
| 14 | Jquery        |           7 |  7 | JavaScript |
| 15 | Angular       |           7 |  7 | JavaScript |
| 16 | ReactJS       |           7 |  7 | JavaScript |
| 17 | Vue.js        |           7 |  7 | JavaScript |
| 18 | Ember.js      |           7 |  7 | JavaScript |
| 19 | Meteor.js     |           7 |  7 | JavaScript |
| 20 | Laravel       |           8 |  8 | PHP        |
| 21 | Symfony       |           8 |  8 | PHP        |
| 22 | CodeIgniter   |           8 |  8 | PHP        |
| 23 | Yii           |           8 |  8 | PHP        |
| 24 | Phalcon       |           8 |  8 | PHP        |
| 25 | Lumen         |           8 |  8 | PHP        |
| 26 | Silex         |           8 |  8 | PHP        |
| 27 | Slim          |           8 |  8 | PHP        |
| 28 | .NET          |           9 |  9 | C#         |
| 29 | .NET          |          10 | 10 | VB         |
| 30 | Django        |          11 | 11 | Python     |
| 31 | Ruby On Rails |          12 | 12 | Ruby       |
+----+---------------+-------------+----+------------+

-- ex3

SELECT `l` . `name`, COUNT( `f` . `name` ) AS `frameworksNumber`
FROM `languages` AS `l`
LEFT JOIN `frameworks` AS `f` ON `languagesId` = `l` . `id`
GROUP BY `l` . `id`;
+------------+------------+
| name       | COUNT( * ) |
+------------+------------+
| C++        |          1 |
| Java       |          1 |
| CSS        |         11 |
| JavaScript |          6 |
| PHP        |          8 |
| C#         |          1 |
| VB         |          1 |
| Python     |          1 |
| Ruby       |          1 |
+------------+------------+

-- Ex4

SELECT `l` . `name`, COUNT( `f` . `name` ) AS `frameworksNumber`
FROM `languages` AS `l`
INNER JOIN `frameworks` AS `f` ON `languagesId` = `l` . `id`
GROUP BY `l` . `id`
HAVING `frameworksNumber` > 3;
+------------+------------+
| name       | COUNT( * ) |
+------------+------------+
| CSS        |         11 |
| JavaScript |          6 |
| PHP        |          8 |
+------------+------------+
