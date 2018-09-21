 select * from (
SELECT
	l.id AS id,
	l.distribution_id AS distributionId,
	d1.name as type,
	plan.distribution as distribution, 
	l.eg_id as egId,
	plan.decision as decision
FROM t_experiment_distribution l
LEFT JOIN t_distribution_plan plan on l.distribution_id = plan.id 
LEFT JOIN t_dict d1 on plan.type = d1.code and d1.cata_code='t_distribution_plan.type'
 ) a 