-- 拼接字段Concat函数
-- 使用AS关键字可以创建别名
-- 可以对字段进行+-*/
SELECT Concat(prod_id,'(',item_price*quantity,'$)') AS '总价'
FROM orderitems;
-- 删除右侧空格RTrim函数，此外还有删除左空格LTrim、删除两端空格Trim
SELECT Concat(RTrim(prod_id),'(',item_price*quantity,'$)') AS '总价'
FROM orderitems;
-- 可以省略FROM子句，仅仅是计算表达式
SELECT 1*10;