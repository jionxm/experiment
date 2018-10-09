 select * from (
SELECT
	l.id AS id,
	l.plan_id AS planId,
	d1.name as type,
	plan.distribution as distribution, 
	l.mirror_id as mirrorId,
	plan.decision as decision
FROM t_mirror_plan l
LEFT JOIN t_distribution_plan plan on l.plan_id = plan.id 
LEFT JOIN t_dict d1 on plan.type = d1.code and d1.cata_code='t_distribution_plan.type'
 ) a 