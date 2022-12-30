-- 查询一列
SELECT `cust_name` FROM `customers`;
-- 查询多列
SELECT `cust_id`,`cust_name`,`cust_country` FROM `customers`;
-- 检索所有列的快捷方式，不建议使用，会降低检索和应用程序的性能
SELECT * FROM `customers`;
-- 只显示不同的值，使用distinct关键字
SELECT DISTINCT `cust_country` FROM `customers`;
-- distinct将综合考虑后面所有的列，而不仅仅是distinct后面第一列
-- 举例：cust_country和cust_name中只要有有一个值不同，都被distinct认为是不同的
SELECT DISTINCT `cust_country`,`cust_name` FROM `customers`;
-- 返回前5行
SELECT `order_num` FROM `orderitems` LIMIT 5;
-- 从第2行（从0开始编号的）开始，返回后面5行
-- 没有足够的行将会截断
SELECT `order_num` FROM `orderitems` LIMIT 2,5;
-- 上一句的等价写法
SELECT `order_num` FROM `orderitems` LIMIT 2 OFFSET 5;
-- 使用完全限定的表名、列名，可以用来应对比如一些重名的情况
-- 注意，我这里给表名、列名加上``符号会报错，这种情况不能加引用符号
SELECT orderitems.order_num FROM mysqldemo.orderitems;