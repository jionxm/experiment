SELECT
	*
FROM
	(
		SELECT
			sr.id AS id,
			sr.student_id AS studentId,
			emp.name AS studentName,
			sr.schedule_id AS scheduleId,
			es.name AS scheduleName,
			sr.result AS result,
			case when isnull(sr.grade) then '' else sr.grade end as grade,
			sr.comment AS comment,
			sr.submit as submit,
			sr.file_id AS fileId,
			CONCAT((case when isnull(fi.filename) then '' else fi.filename end),'.',fi.file_type) as fileName,
			sr.create_time AS updateTime,
			sr.create_by AS createBy,
			empfir.name AS createByName,
			sr.update_time AS createTime,
			sr.update_by AS updateBy,
			empsec.name AS updateByName,
			sr.update_count AS updateCount
		FROM
			t_student_record sr
		LEFT JOIN t_employee empfir ON sr.create_by = empfir.id
		LEFT JOIN t_employee empsec ON sr.update_by = empsec.id
		LEFT JOIN t_experiment_schedule es ON sr.schedule_id = es.id
		LEFT JOIN t_file_index fi ON sr.file_id = fi.id
		LEFT JOIN t_user s ON sr.student_id = s.id
		left join t_employee emp on s.emp_id=emp.id
	) a