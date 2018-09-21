 select * from (
SELECT
	l.id AS id,
	l.name AS name,
	l.create_time as createTime,
	l.create_by as createBy,
	l.update_time as updateTime ,
	l.update_by as updateBy,
	l.update_count as updateCount
FROM t_student l
 ) a 