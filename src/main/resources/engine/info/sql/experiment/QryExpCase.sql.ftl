SELECT
	*
FROM
	(
		SELECT
			l.id AS id,
			l.name AS name,
			l.demand AS demand,
			l.target AS target,
			l.content AS content,
			l.report_demand AS reportDemand,
			l.report_target AS reportTarget,
			l.report_content AS reportContent,
			l.update_time AS createTime,
			l.create_by AS createBy,
			emp.name AS createByName,
			l.create_time AS updateTime,
			l.update_by AS updateBy,
			l.update_count AS updateCount,
			empsec.name AS updateByName,
			l.pic_id as picId,
			case when isnull(le.filename) then '' else le.filename end as picName
		FROM
			t_experiment_eg l
		LEFT JOIN t_employee emp ON l.create_by = emp.id
		LEFT JOIN t_employee empsec ON l.update_by = empsec.id
		LEFT JOIN t_file_index le ON l.pic_id = le.id
	) a