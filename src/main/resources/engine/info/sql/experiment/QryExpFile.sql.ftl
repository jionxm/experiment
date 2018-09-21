 select * from (
SELECT
	l.id AS id,
	CONCAT((case when isnull(file.filename) then '' else file.filename end),'.',file.file_type) as fileName,
	l.file_id as fileId,
	l.eg_id as egId
FROM t_experiment_file l
left join t_file_index file on l.file_id=file.id 
 ) a 