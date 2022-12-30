-- 根据单列排序，默认是升序
SELECT prod_id,note_text FROM productnotes
ORDER BY prod_id;
-- 根据多列排序，将按照列的顺序进行
SELECT prod_id,note_date,note_text FROM productnotes
ORDER BY prod_id,note_date;
-- 可指定排序是升序还是降序DESC，默认是升序ASC
-- 一个关键字仅对一个列生效
SELECT prod_id,note_date,note_text FROM productnotes
ORDER BY prod_id DESC,note_date ASC;
-- 一个小应用：找出单价最高的产品
SELECT prod_name,prod_price FROM products
ORDER BY prod_price DESC
LIMIT 1;