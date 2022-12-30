-- 创建表
-- test_id设置为自增主键，存储引擎设置为InnoDB
-- test_quantity字段指定默认值为1
-- DROP TABLE IF EXISTS tb_test意思是在创建表之前先确认并删除已经存在的重名表
DROP TABLE IF EXISTS tb_test;
CREATE TABLE tb_test
(
	test_id INT NOT NULL AUTO_INCREMENT,
	test_name VARCHAR(20) NOT NULL,
	test_address CHAR(50) NULL,
	test_quantity INT NOT NULL DEFAULT 1,
	PRIMARY KEY (test_id)
)ENGINE=InnoDB;

-- 获取最后一个AUTO_INCREMENT值
SELECT last_insert_id() FROM tb_test;

-- 修改表结构：添加一个列
ALTER TABLE tb_test
ADD tb_phone CHAR(11) NOT NULL;

-- 修改表结构：删除一个列
ALTER TABLE tb_test
DROP COLUMN tb_phone;

-- 一条语句作多条更改
ALTER TABLE tb_test
ADD tb_phone CHAR(11) NOT NULL,
DROP COLUMN tb_phone;

-- 删除表
DROP TABLE tb_test;

-- 重命名表
RENAME TABLE products TO products1;
RENAME TABLE products1 TO products;

-- 批量重命名
RENAME TABLE products TO products1,
						products1 TO products;