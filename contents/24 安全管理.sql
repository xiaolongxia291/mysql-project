-- 查看系统用户名
USE mysql;
SELECT user FROM user;

-- 创建一个用户，名为tracy密码为tracypassword
CREATE USER tracy IDENTIFIED BY 'tracypassword';

-- 重命名用户
RENAME USER tracy to tracynew;

-- 删除用户
DROP USER tracynew;

-- 新创建的用户没有访问权限，只能登录，但无法访问数据

-- 查看用户权限
-- GRANT USAGE ON *.* TO `tracy`@`%`表示tracy用户还没有权限
-- `tracy`@`%`中的%表示不限制主机名
SHOW GRANTS FOR tracy;

-- 授予用户权限
-- 将mysqldemo数据库中所有表的SELECT权限授予给tracy用户
GRANT SELECT ON mysqldemo.* TO tracy;

-- 撤销用户权限
-- 将mysqldemo数据库中所有表的SELECT权限授予给tracy用户
REVOKE SELECT ON mysqldemo.* FROM tracy;

-- 授予全部权限
GRANT ALL ON mysqldemo.* TO tracy;

-- 撤销全部权限
REVOKE ALL ON mysqldemo.* FROM tracy;

-- 修改用户密码
ALTER USER tracy IDENTIFIED BY 'newpassword';