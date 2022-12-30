-- 正则表达式用来匹配文本特殊的串，使用关键字REGEXP
-- REGEXP匹配列中的值，LIKE匹配整个列
-- 匹配prod_id包含0的记录
SELECT * FROM orderitems
WHERE prod_id REGEXP '0';
-- 小数点表示匹配任意一个字符
SELECT * FROM products
WHERE prod_name REGEXP '.on';
-- 竖线|表示OR匹配
SELECT * FROM products
WHERE prod_name REGEXP 'on|an';
-- 中括号[]表示匹配括号中任意一个字符，相当于另一种形式的OR
SELECT * FROM products
WHERE prod_name REGEXP '[ao]n';
-- 加上^表示否定
-- 表示除了an on以外的?n
SELECT * FROM products
WHERE prod_name REGEXP '[^ao]n';
-- 使用-表示范围
-- [2-6]表示匹配2、3、4、5、6中的一个
SELECT * FROM products
WHERE prod_name REGEXP '[2-6]';
-- 匹配特殊字符需要加上\\用于转义
-- 匹配小数点
SELECT * FROM products
WHERE prod_name REGEXP '\\.';
-- 匹配单斜杠\，书上说的是三个斜杠，但我的mysql要写四个斜杠
SELECT * FROM products
WHERE prod_name REGEXP '\\\\';
-- 还有一些空白元字符：\\f表示换页，\\n表示换行，\\r表示回车，\\t表示制表，\\v表示纵向制表
-- 可以自行尝试

-- 匹配预定义的字符集，即字符类
-- [:alnum:]表示任意字母和数字，相当于[a-zA-Z0-9]
-- [:alpha:]表示任意字母，相当于[a-zA-Z]
-- [:blank:]表示空格和制表符，相当于[\\t]
-- [:cntrl:]表示ASCII控制字符
-- [:digit:]表示任意数字
-- [:lower:]表示任意小写字母
-- [:print:]表示任意可打印字符
-- [:punct:]表示既不在[:alnum:]又不在[:cntrl:]中的任意字符
-- [:space:]表示任意空白字符，等同于[\\f\\n\\r\\t\\v]
-- [:upper:]表示任意大写字母
-- [:xdigit:]表示任意十六进制数字，相当于[a-fA-F0-9]

-- 下面的重复元字符挺重要的
-- ?表示0个或1个匹配，下面这条语句匹配stick和sticks
SELECT * FROM products 
WHERE prod_name REGEXP 'sticks?';
-- {n,}匹配指定数目的匹配
-- 匹配连续出现的三个0
SELECT * FROM products 
WHERE prod_name REGEXP '[0]{3}';
-- {n,}匹配不少于指定数目的匹配
-- 匹配至少有一个连续的0
SELECT * FROM products 
WHERE prod_name REGEXP '[0]{1,}';
-- {n,m}匹配连续出现n~m次
-- 匹配至少有一个连续的0
SELECT * FROM products 
WHERE prod_name REGEXP '[0]{1,2}';
-- *匹配0~任意个重复字符
SELECT * FROM products 
WHERE prod_name REGEXP '[0]*';
-- +匹配一个或多个重复字符
SELECT * FROM products 
WHERE prod_name REGEXP '[0]+';

-- 定位符
-- ^表示文本的开始，注意，这个符号也可以用来表示否定，在上面已经说过了
-- 匹配值以数字或小数点开始的记录
SELECT * FROM products 
WHERE prod_name REGEXP '^[0-9\\.]';
-- $表示文本的结尾
-- 匹配值以l结尾的记录
SELECT * FROM products 
WHERE prod_name REGEXP '[l]$';

