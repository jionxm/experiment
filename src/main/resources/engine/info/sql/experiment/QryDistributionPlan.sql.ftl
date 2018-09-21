 select * from (
SELECT
	l.id AS id,
	l.distribution AS distribution,
	l.decision AS decision,
	l.type AS type,
	d1.name as typeName,
	l.create_time as createTime,
	l.create_by as createBy,
	emp.name as createByName,
	l.update_time as updateTime,
	l.update_by as updateBy,
	empsec.name as updateByName,
	l.update_count as updateCount
FROM t_distribution_plan l
LEFT JOIN t_dict d1 on l.type = d1.code and d1.cata_code='t_distribution_plan.type'
left join t_employee emp on l.create_by=emp.id
left join t_employee empsec on l.update_by=empsec.id
 ) a 