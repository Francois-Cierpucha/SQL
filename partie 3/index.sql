-- ex1

USE `webDevelopment`;
ALTER TABLE `languages`
ADD COLUMN `versions` VARCHAR(20);

--Ex2

USE `webDevelopment`;
ALTER TABLE `frameworks`
ADD COLUMN
`version` INT, ;

--Ex3

USE `webDevelopment`;
ALTER TABLE `languages`
CHANGE `versions` `version` VARCHAR(20)
;

-- Ex4

USE `webDevelopment`;
ALTER TABLE `frameworks`
CHANGE `name` `framework` VARCHAR(20)
;

--Ex5

USE `webDevelopment`;
ALTER TABLE `frameworks`
MODIFY `framework` VARCHAR(10)
;
