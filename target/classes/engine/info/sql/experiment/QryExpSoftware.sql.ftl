 select * from (
SELECT
	l.id AS id,
	l.software_id AS softwareId,
	soft.name as name,
	soft.version as version,
	soft.git_path as gitPath,
	l.eg_id as egId
FROM t_experiment_software l
LEFT JOIN t_software soft on l.software_id = soft.id
 ) a 