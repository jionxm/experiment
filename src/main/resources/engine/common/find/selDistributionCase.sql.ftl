select * from (
	select 
	e.id as id,
	d1.name as type,
	e.decision as decision,
	e.distribution as distribution
	 from t_distribution_plan e
	 LEFT JOIN t_dict d1 on e.type = d1.code and d1.cata_code='t_distribution_plan.type'
 ) a 