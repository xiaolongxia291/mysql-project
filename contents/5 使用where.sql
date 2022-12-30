-- where不区分大小写
-- =等于
SELECT * FROM customers WHERE cust_id=10001;
-- <>不等于
SELECT * FROM customers WHERE cust_id<>10001;
-- !=不等于，和上一句等价
SELECT * FROM customers WHERE cust_id!=10001;
-- <小于
SELECT * FROM customers WHERE cust_id<10003;
-- <=小于等于
SELECT * FROM customers WHERE cust_id<=10003;
-- >大于
SELECT * FROM customers WHERE cust_id>10003;
-- >=大于等于
SELECT * FROM customers WHERE cust_id>=10003;
-- between范围，包含边界
SELECT * FROM customers WHERE cust_id BETWEEN 10001 AND 10003;
-- 为空检查
SELECT * FROM vendors WHERE vend_state IS NULL;
-- 不为空检查
SELECT * FROM vendors WHERE vend_state IS NOT NULL;