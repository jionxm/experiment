 select * from (
SELECT
	l.id AS id,
	l.git_path AS gitPath,
	l.decision AS decision,
	l.type AS type,
	d1.name as typeName,
	l.file_id AS fileId,
	l.flag AS flag,
	d2.name as flagName,
	case when preset='N' then '默认'
		 when preset='Y' then '自有' end as presetName,
	l.preset as preset,
	case when isnull(file.filename) then '' else file.filename end as fileName,
	l.create_time as createTime,
	l.create_by as createBy,
	l.update_time as updateTime ,
	l.update_by as updateBy,
	l.update_count as updateCount
FROM t_code l
LEFT JOIN t_dict d1 on l.type = d1.code and d1.cata_code='t_code.type' 
LEFT JOIN t_dict d2 on l.flag = d2.code and d2.cata_code='t_code.flag'
left join t_file_index file on l.file_id=file.id 
 ) a 