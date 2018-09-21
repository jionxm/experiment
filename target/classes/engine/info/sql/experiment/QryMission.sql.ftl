 select * from (
SELECT
	l.id AS id,
	l.name as name,
	l.decision as decision,
	l.start_time as startTime,
	l.end_time as endTime,
	l.executor,
	em.name as executorName,
	l.server as server,
	l.teacher_id as teacherId,
	l.db,
	l.error_log as errorLog,
	l.update_time as createTime,
	l.create_by as createBy,
	emp.name as createByName,
	l.create_time as updateTime ,
	l.update_by as updateBy,
	l.update_count as updateCount,
	'查看详情' as view
FROM t_mission l
	left join t_employee emp on l.create_by=emp.id
	left join t_employee em on l.executor=em.id
 ) a 