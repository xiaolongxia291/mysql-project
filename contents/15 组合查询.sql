-- 组合查询
-- UNION和使用子查询在不同情况下各有优劣

-- UNION使用规则：
-- UNION中的每个查询必须包含相同的列、表达式、聚集函数，顺序可以不一样
-- UNION将对结果自动去除重复的行，使用UNION ALL可以不去除重复的行

-- ORDER BY将对全部结果进行排序
SELECT order_num,prod_id,quantity FROM orderitems WHERE quantity=1
UNION
SELECT order_num,prod_id,quantity FROM orderitems WHERE quantity=50
ORDER BY order_num;