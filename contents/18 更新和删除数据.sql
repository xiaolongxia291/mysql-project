-- 修改表数据
-- 注意：如果忘写where子句将会修改所有行的数据
UPDATE products 
SET prod_price=6.00,prod_name=CONCAT(prod_name,'_updated')
WHERE prod_price>=50;

-- 使用ignore关键字
-- 一般情况下，执行update语句的过程中如果发生错误，将会更新失败
-- 使用ignore关键字，发生错误，语句会忽略错误，继续执行
UPDATE IGNORE products 
SET prod_price=6.00,prod_name=CONCAT(prod_name,'_updated')
WHERE prod_price>=50;

-- 删除表数据
-- 我先插入两条语句供后面删除
INSERT INTO products(prod_id,vend_id,prod_name,prod_price,prod_desc)
VALUES('SAFE0',1003,'Safe_updated',7.00,'Safe with combination lock'),
('SAFE1',1003,'Safe_updated',7.00,'Safe with combination lock');
-- 从表中删除特定行
-- 注意：如果忘写where子句将会删除所有行的数据
DELETE FROM products 
WHERE prod_price=7.00;

-- 更快的删除
-- 如果要删除整张表，使用下面的语句会更快，会重新创建一个表，并删除原来的表
-- 我先创建一个表并插入数据
CREATE TABLE products_new
(
  prod_id    char(10)      NOT NULL,
  vend_id    int           NOT NULL ,
  prod_name  char(255)     NOT NULL ,
  prod_price decimal(8,2)  NOT NULL ,
  prod_desc  text          NULL ,
  PRIMARY KEY(prod_id)
) ENGINE=InnoDB;
INSERT INTO products_new
SELECT * FROM products;
-- 删除所有的行，这个表会变成空表
TRUNCATE TABLE products_new;