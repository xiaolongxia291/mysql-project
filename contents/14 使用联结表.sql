-- 联结是一种机制，用来在一条SELECT语句中关联表
-- 相比嵌套的子查询，联结的可读性更好
-- 要用where子句进行过滤，否则会返回表之间的笛卡尔积

-- 内部联结/等值联结
-- 写法一
SELECT O.prod_id,P.prod_name,O.item_price FROM orderitems AS O,products AS P
WHERE O.prod_id=P.prod_id;
-- 写法二
SELECT O.prod_id,P.prod_name,O.item_price FROM orderitems AS O INNER JOIN products AS P
ON O.prod_id=P.prod_id;

-- 自联接：同一张表和自己的联结
-- 在product表中，查找prod_id为ANV01的记录涉及的vend_id，然后再查看这个vend_id所涉及的所有记录
-- 写法一：使用子查询
SELECT prod_id,vend_id,prod_name,prod_price FROM products WHERE vend_id IN
(SELECT vend_id FROM products WHERE prod_id='ANV01')
-- 写法二：使用自联接
SELECT p1.prod_id,p1.vend_id,p1.prod_name,p1.prod_price FROM products AS p1
INNER JOIN products AS p2
ON p1.vend_id=p2.vend_id AND p2.prod_id='ANV01';

-- 自然联结：没有重复列的联结，由写sql的人实现

-- 外部联结：一个表和另一个表联结，包含了没有关联行的那些行
-- 左外部联结：将左边表未被关联的行也包括进来
SELECT c.cust_name,count(o.order_num) AS order_count 
FROM customers AS c LEFT OUTER JOIN orders AS o
ON c.cust_id=o.cust_id
GROUP BY c.cust_name;
-- 右外部联结：将右边表未被关联的行也包括进来
SELECT c.cust_name,count(o.order_num) AS order_count 
FROM orders AS o RIGHT OUTER JOIN customers AS c
ON c.cust_id=o.cust_id
GROUP BY c.cust_name
ORDER BY order_count;