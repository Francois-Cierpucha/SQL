CREATE DATABASE IF NOT EXISTS `frameworks CHARACTER SET 'UTF8';
DROP DATABASE IF EXISTS `FRAMEWORKS` CHARACTER SET 'utf8';

CREATE DATABASE IF NOT EXISTS `languages` CHARACTER SET 'utf8';

mysql> DROP DATABASE `languages`;
Query OK, 0 rows affected (0.02 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| webDevelopment     |
| wordpress          |
+--------------------+
6 rows in set (0.00 sec)


mysql> DROP DATABASE IF EXISTS `frameworks`;
Query OK, 0 rows affected, 1 warning (0.01 sec)

mysql> DROP DATABASE  `frameworks`;

mysql> DROP DATABASE IF EXISTS `languages`;
Query OK, 0 rows affected, 1 warning (0.01 sec)




