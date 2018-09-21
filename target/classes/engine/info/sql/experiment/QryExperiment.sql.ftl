 select * from (
SELECT
	l.id AS id,
	l.position AS position,
	l.decision AS decision,
	l.type AS type,
	d1.name as typeName,
	l.file_id AS fileId,
	l.preset as preset,
	case when preset='N' then '默认'
		 when preset='Y' then '自有' end as presetName,
	case when isnull(file.filename) then '' else file.filename end as fileName,
	l.create_time as createTime,
	l.create_by as createBy,
	l.update_time as updateTime,
	l.update_by as updateBy,
	l.update_count as updateCount
FROM t_experiment l
LEFT JOIN t_dict d1 on l.type = d1.code and d1.cata_code='t_experiment.type' 
left join t_file_index file on l.file_id=file.id 
 ) a 