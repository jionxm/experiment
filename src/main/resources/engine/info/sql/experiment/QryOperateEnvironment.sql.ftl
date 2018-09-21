 select * from (
SELECT
	l.id AS id,
	l.operate_id AS operateId,
	l.eg_id as egId,
	en.name as name,
	dict.name as type,
	en.distribution as distribution
FROM t_experiment_operate l
LEFT JOIN t_operate_environment en on l.operate_id = en.id 
	left join t_dict dict on en.type=dict.code and dict.cata_code='t_operate_environment.type'
 ) a 