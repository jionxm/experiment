 select * from (
SELECT
	l.id AS id,
	l.student_id AS studentId,
	l.student_name AS studentName,
	l.experiment_id AS experimentId,
	l.result AS result,
	l.grade AS grade,
	l.teacher_id as teacherId,
	l.create_time as createTime,
	l.create_by as createBy,
	l.update_time as updateTime ,
	l.update_by as updateBy,
	l.update_count as updateCount
FROM t_student_record l
 ) a 