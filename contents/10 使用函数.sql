-- 文本处理函数
-- Upper将文本全部转换为大写
SELECT Upper(prod_name) FROM products;
-- 此外还有：Left返回串左边的字符，Right返回串右边的字符，
-- Length返回串的长度，Locate找出串的一个子串的位置
-- Lower转换为小写，Upper转换为大写，LTrim去掉左边空格，RTrim去掉右边空格，Trim去掉两边空格
-- SubString返回指定位置的子串
-- Soundex返回串的读音

-- ton为子串，将返回子串在prod_name中的位置
SELECT Locate('ton',prod_name) FROM products;
-- 1表示从第一个字符开始，3表示偏移量为3
SELECT SubString(prod_name,1,3) FROM products;
-- Y Lee和Y Lie读音相同，将会被检索出来
SELECT * FROM customers
WHERE Soundex(cust_contact) = Soundex('Y lie');

-- 时间和日期格式
-- Mysql首选日期格式为yyyy-mm-dd
-- Date返回日期和时间的yyyy-mm-dd部分
SELECT * FROM orders
WHERE Date(order_date)='2005-09-01';
-- 支持范围查询
SELECT * FROM orders
WHERE Date(order_date) BETWEEN '2005-09-01' AND '2005-09-12';
-- Year返回日期和时间的年份
SELECT * FROM orders
WHERE Year(order_date)='2005';
-- Month返回日期和时间的月份，9或者09都能匹配
SELECT * FROM orders
WHERE Month(order_date)='9';
-- Day返回日期和时间的具体几号
SELECT * FROM orders
WHERE Day(order_date)='1';

-- 数值处理函数
-- Abs绝对值、Cos余弦三角函数、Exp指数、Mod求余、Pi返回圆周率、Rand返回一个随机数
-- Sin正弦三角函数、Sqrt平方根、Tan正切三角函数
SELECT Abs(-1);
