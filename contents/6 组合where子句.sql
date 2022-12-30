-- AND且
SELECT vend_id,vend_name FROM vendors
WHERE vend_id > 1003 AND vend_id < 1005;
-- OR或
SELECT vend_id,vend_name FROM vendors
WHERE vend_id < 1003 OR vend_id > 1005;
-- 组合多条，AND优先于OR
SELECT vend_id,vend_name FROM vendors
WHERE (vend_id > 1003 OR vend_id < 1005) AND vend_id = 1004;
-- IN指定范围
SELECT vend_id,vend_name FROM vendors
WHERE vend_id IN (1001,1003,1004);
-- NOT表示非
SELECT vend_id,vend_name FROM vendors
WHERE vend_id NOT IN (1001,1003);