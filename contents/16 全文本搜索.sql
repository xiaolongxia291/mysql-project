-- 全文本搜索
-- MyISAM支持全文本搜索，InnoDB不支持
-- 使用全文本搜索必须索引被搜索的列，且要保持更新
-- 全文搜索由于使用了索引，所以速度相当快

-- 启用全文搜索：
-- 可以在创建表时启用
-- 也可以在已经创建表的情况下启用，所有数据会被立即索引
-- 不应该在导入数据时启用，因为更新操作会导致索引不断被更新
-- CREATE TABLE texttable(
-- 	text_id	int NOT NULL AUTO_INCREMENT,
-- 	text_content text NULL,
-- 	PRIMARY KEY(text_id),
-- 	FULLTEXT(text_content)
-- )ENGINE=MyISAM;

-- 使用全文搜索：
-- Match()指定要搜索的列，Against()指定搜索表达式
-- select的列和match的列必须完全一致，包括次序
-- 全文搜索忽略大小写
-- 全文搜索将对搜索结果根据相关性排序
SELECT note_text From productnotes
WHERE Match(note_text) Against('customer');

-- 使用查询扩展：
-- 先全文搜索出能匹配的行，然后在匹配上的行中选出有用的其他词，再进行一次全文搜索，将结果放入返回结果中
SELECT note_text From productnotes
WHERE Match(note_text) Against('customer' WITH QUERY EXPANSION);

-- 布尔文本搜索
-- 可以定义要匹配的词、要排斥的词、词的重要性等等
-- 匹配heavy但排除以rope开始的词
SELECT note_text From productnotes
WHERE Match(note_text) Against('customer -stick*' IN BOOLEAN MODE);
-- 全文本布尔操作符：
-- +包含，-排除，>包含且增加等级值，<包含且减少等级值，~取消一个词的排序值
-- *词尾的通配符，""定义一个短语，()把词组成子表达式
-- +表示必须包含
SELECT note_text From productnotes
WHERE Match(note_text) Against('+customer +stick*' IN BOOLEAN MODE);
-- 这种写法，只要含有一个词就能被检索到
SELECT note_text From productnotes
WHERE Match(note_text) Against('customer stick*' IN BOOLEAN MODE);
