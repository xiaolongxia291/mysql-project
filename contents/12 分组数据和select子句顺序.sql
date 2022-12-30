-- 创建分组
-- 如果分组列中有NULL值，他们将会被分为一组
SELECT prod_id,COUNT(note_id) AS count 
FROM productnotes 
GROUP BY prod_id 
ORDER BY prod_id;

-- 过滤分组
-- where针对行过滤，而having针对组过滤，换句话说：where进行分组前的过滤，having进行分组后的过滤
SELECT prod_id,COUNT(note_id) AS count
FROM productnotes 
WHERE Date(note_date) >= '2005-8-20'
GROUP BY prod_id 
HAVING count>=2
ORDER BY prod_id;

-- select子句顺序：
SELECT prod_id,COUNT(note_id) AS count
FROM productnotes 
WHERE Date(note_date) >= '2005-8-20'
GROUP BY prod_id 
HAVING count>=1
ORDER BY count
LIMIT 6;
