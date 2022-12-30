-- 最常使用的%表示任意字符出现任意次数，包括0次
-- mysql的匹配默认是不区分大小写的，可以通过设置使它区分大小写
-- 找出所有cust_name以c开头的记录
SELECT * FROM customers WHERE cust_name LIKE 'c%';
-- 匹配所有cust_name包含c的记录
SELECT * FROM customers WHERE cust_name LIKE '%c%';
-- 匹配所有cust_name包含以w开头s结尾的记录
SELECT * FROM customers WHERE cust_name LIKE 'w%s';
-- 下划线_匹配单个字符
-- 匹配所有cust_name为?ascals的记录
SELECT * FROM customers WHERE cust_name LIKE '_ascals';