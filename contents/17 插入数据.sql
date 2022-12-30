-- 插入完整的行：这种写法依赖于表结构中列的特定次序，不安全
INSERT INTO products
VALUES('TRACY00',1001,'pencil00',0.25,'Carrots (rabbit hunting season only)');
-- 这种写法可以插入完整的行，也可以插入部分列的值，并且不依赖于表结构中列的顺序
INSERT INTO products(prod_id,vend_id,prod_name,prod_price,prod_desc)
VALUES('TRACY01',1001,'pencil01',0.45,'Carrots (rabbit hunting season only)');

-- 省略部分列应注意：该列允许为NULL，或者给出了默认值

-- 添加关键字LOW_PRIORITY
-- 有时间INSERT语句会很耗时，可以在INSERT和INTO之间添加LOW_PRIORITY关键字来降低INSERT语句的优先级
INSERT LOW_PRIORITY INTO products(prod_id,vend_id,prod_name,prod_price,prod_desc)
VALUES('TRACY02',1001,'pencil02',0.75,'Carrots (rabbit hunting season only)');

-- 插入多个行：相比执行多条INSERT语句会更快
INSERT INTO products(prod_id,vend_id,prod_name,prod_price,prod_desc)
VALUES
('TRACY03',1001,'pencil03',0.45,'Carrots (rabbit hunting season only)'),
('TRACY04',1001,'pencil04',0.45,'Carrots (rabbit hunting season only)'),
('TRACY05',1001,'pencil05',0.45,'Carrots (rabbit hunting season only)'),
('TRACY06',1001,'pencil06',0.45,'Carrots (rabbit hunting season only)'),
('TRACY07',1001,'pencil07',0.45,'Carrots (rabbit hunting season only)');


-- 插入检索出来的行，根据列的位置而不是列名填充数据，列名甚至可以匹配不上
INSERT INTO customers(cust_name,cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email)
SELECT CONCAT(cust_name,'_new'),cust_address,cust_city,cust_state,cust_zip,cust_country,cust_contact,cust_email
FROM customers
WHERE cust_id>10003;