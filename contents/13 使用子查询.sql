-- 子查询：组合查询语句
-- 子查询可以嵌套很多层，但是可读性差，性能不高
-- 查询order_item>=3的订单所涉及的产品详细信息
SELECT * FROM products WHERE prod_id 
IN(SELECT prod_id FROM orderitems WHERE order_item>=3);

-- 作为计算字段使用子查询
-- 产品详细信息，以及每个产品所涉及的order_item总数
SELECT prod_id,prod_name,prod_price, (SELECT COUNT(*) FROM orderitems WHERE orderitems.prod_id=products.prod_id) AS total
FROM products;
