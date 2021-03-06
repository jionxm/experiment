 select * from (
SELECT
	l.id AS id,
	l.name AS name,
	l.eg_id as egId,
	l.teacher_id as teacherId,
	l.course_id as courseId,
	l.status as status,
	l.end_time as endTime,
	l.create_by as createBy,
	emp.name as createByName,
	l.create_time as createTime,
	l.update_time as updateTime ,
	l.update_by as updateBy,
	empsec.name as updateByName,
	l.update_count as updateCount,
	eg.name as egName,
	course.stage_name as courseName,
	eg.demand as demand,
	eg.target as target,
	eg.content as content,
	eg.report_demand as reportDemand,
	eg.report_target as reportTarget,
	eg.report_content as reportContent,
	l.count_down as countDown,
	l.count_down as countDown1,
	empt.name as teacherName,
	l.begin_address as beginAddress,
	l.end_address as endAddress,
	case when l.status = 0 then "未开启"
		 when l.status = 1 then "已开启" end as statusName
FROM t_experiment_schedule l
	left join t_experiment_eg eg on l.eg_id = eg.id
	left join t_user user on l.teacher_id = user.id
	left join t_employee empt on user.emp_id=empt.id
	left join t_employee emp on l.create_by=emp.id
	left join t_employee empsec on l.update_by=empsec.id
	left join t_exp_course course on l.course_id = course.id
 ) a 