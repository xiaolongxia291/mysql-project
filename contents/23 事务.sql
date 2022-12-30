-- INNODB支持事务管理，MyISAM不支持
-- 几个关键词：事务、提交、回退、保存点
START TRANSACTION;
DELETE FROM customers WHERE cust_id='10001';
-- 设置一个保存点point1
SAVEPOINT point1;
DELETE FROM customers WHERE cust_id='10002';
DELETE FROM customers WHERE cust_id='10003';
-- 回退到START TRANSACTION，只能针对UPDATE、INSERT、DELETE回退
ROLLBACK;
DELETE FROM customers WHERE cust_id='10004';
-- 回退到保留点point1
ROLLBACK TO point1;
DELETE FROM customers WHERE cust_id='10005';
-- 提交事务
COMMIT;