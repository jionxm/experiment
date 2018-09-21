 select * from (
SELECT
	l.id AS id,
	l.name as name,
	l.type as type,
	l.distribution as distribution,
	l.create_time as createTime,
	l.create_by as createBy,
	l.update_time as updateTime ,
	l.update_by as updateBy,
	l.update_count as updateCount,
	dict.name as typeName
FROM t_operate_environment l
left join t_dict dict on l.type=dict.code and cata_code = 't_operate_environment.type'
 ) a 