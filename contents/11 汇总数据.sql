-- SQL聚集函数：
-- AVG返回某列平均值，忽略值为NULL的行
SELECT AVG(item_price) AS avg_price FROM orderitems;
-- COUNT统计某列行数，COUNT(列名)忽略NULL行，COUNT(*)不忽略
SELECT COUNT(item_price) AS count FROM orderitems;
-- MAX最大值，忽略NULL
SELECT MAX(item_price) AS max_price FROM orderitems;
-- MIN最小值，忽略NULL
SELECT MIN(item_price) AS min_price FROM orderitems;
-- SUM求和，忽略NULL
SELECT SUM(item_price) AS sum_price FROM orderitems;

-- 对于以上所有函数，可在列名前使用DISTINCT，对该列仅处理非重复行
-- 以下两句将返回不同的结果
SELECT COUNT(item_price) AS count FROM orderitems;
SELECT COUNT(DISTINCT item_price) AS count FROM orderitems;

