SELECT * FROM(
SELECT
l.id AS id,
emp.name as name
FROM t_user l
left join t_employee emp on l.emp_id = emp.id
inner JOIN t_user_role role on l.id=role.user_id and role.role_id=207
)a 
