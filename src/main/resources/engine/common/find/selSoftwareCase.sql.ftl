select * from (
	select 
	e.id as id,
	e.name as name,
	e.git_path as gitPath,
	e.version as version
	 from t_software e
 ) a 