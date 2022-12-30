-- 展示当前连接下的所有数据库，包含了系统数据库
SHOW DATABASES;
-- 使用名为mysqldemo的数据库
USE mysqldemo;
-- 展示当前数据库下的所有表
SHOW TABLES;
-- 展示customers表中的列信息，下面两句是等价的
SHOW COLUMNS FROM customers;
DESCRIBE customers;
-- 显示服务器状态信息
SHOW STATUS;
-- 显示我的mysqldemo数据库的创建信息
SHOW CREATE DATABASE mysqldemo;
-- 显示当前数据库下customers表的创建信息
SHOW CREATE TABLE customers;
-- 显示所有用户的权限信息
SHOW GRANTS;
-- 显示服务器错误
SHOW ERRORS;
-- 显示服务器警告
SHOW WARNINGS;