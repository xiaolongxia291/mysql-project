-- 视图
-- 包含的不是实际的数据，而是一个SQL查询
-- 视图相当于虚拟的表，因此可以使用where查询子句、逻辑运算符、函数等
-- 优点：重用SQL、简化查询操作、格式化查询结果

-- 创建视图
CREATE VIEW viewdemo AS
SELECT p1.prod_id,p1.vend_id,p1.prod_name,p1.prod_price FROM products AS p1
INNER JOIN products AS p2
ON p1.vend_id=p2.vend_id AND p2.prod_id='ANV01';

-- 使用视图，可将其视作一张虚拟的表
SELECT * FROM viewdemo
WHERE prod_price=5.99;

-- 通过视图将查询结果包装成格式化的结果
CREATE VIEW customers_list AS
SELECT CONCAT('(',cust_id,')',cust_name) AS customers_list FROM customers;
-- 查询
SELECT * FROM customers_list;

-- 视图的删除
DROP VIEW customers_list;


