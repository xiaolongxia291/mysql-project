-- 触发器
-- 每个表可创建6个触发器，每条INSERT、UPDATE、DELETE之前和之后
-- 仅支持表，不支持视图

-- 创建触发器
-- NEW表示插入语句执行后的表
CREATE TRIGGER customer_insert AFTER INSERT ON customers
FOR EACH ROW SELECT NEW.cust_id INTO @newcust_id;

-- 插入一条数据试试
INSERT INTO customers(cust_name, cust_address, cust_city, cust_state, cust_zip, cust_country, cust_contact, cust_email)
VALUE('Coyote Inc.', '200 Maple Lane', 'Detroit', 'MI', '44444', 'USA', 'Y Lee', 'ylee@coyote.com');

-- 获取触发器记录的变量值
SELECT @newcust_id;

-- 删除触发器
DROP TRIGGER customer_insert;

-- 再创建一个UPDATE触发器
-- OLD表示修改之前的表
CREATE TRIGGER customer_update AFTER UPDATE ON customers
FOR EACH ROW SELECT OLD.cust_name INTO @newcust_name;