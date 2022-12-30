-- 创建存储过程
CREATE PROCEDURE productpricing()
BEGIN
	SELECT MAX(prod_price) AS pricehigh,MIN(prod_price) AS pricelow,AVG(prod_price) AS priceaverage
	FROM products;
END;


-- 使用存储过程
CALL productpricing();


-- 删除存储过程
DROP PROCEDURE IF EXISTS productpricing;


-- 使用参数
-- OUT声明的是返回的参数
DROP PROCEDURE IF EXISTS productpricing;
CREATE PROCEDURE productpricing(
	OUT p1 DECIMAL(8,2),
	OUT p2 DECIMAL(8,2),
	OUT p3 DECIMAL(8,2)
)
BEGIN
	SELECT MAX(prod_price) INTO p1 FROM products;
	SELECT MIN(prod_price) INTO p2  FROM products;
	SELECT AVG(prod_price) INTO p3  FROM products;
END;

-- 调用需要指定3个变量名
CALL productpricing(@pricehigh,@pricelow,@priceavg);

-- 由于调用了存储过程，因此获得了三个存放了返回值的变量，可以检索它们的值
SELECT @pricehigh,@pricelow,@priceavg;


-- 使用参数
-- IN声明的是传入的参数
DROP PROCEDURE IF EXISTS productpricing;
CREATE PROCEDURE productpricing(
	IN lim DECIMAL(8,2),
	OUT p1 DECIMAL(8,2),
	OUT p2 DECIMAL(8,2),
	OUT p3 DECIMAL(8,2)
)
BEGIN
	SELECT MAX(prod_price) FROM products WHERE prod_price>=lim INTO p1;
	SELECT MIN(prod_price) FROM products WHERE prod_price>=lim INTO p2;
	SELECT AVG(prod_price) FROM products WHERE prod_price>=lim INTO p3;
END;

-- 现在调用存储过程会得到不同的结果
CALL productpricing(10.00,@pricehigh,@pricelow,@priceavg);
SELECT @pricehigh,@pricelow,@priceavg;