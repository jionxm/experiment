select * from (
	select 
	e.id as id,
	e.name as name,
	e.type as type,
	e.distribution as distribution
	 from t_operate_environment e
 ) a 