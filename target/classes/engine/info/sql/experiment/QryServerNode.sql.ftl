 select * from (
SELECT
	l.id AS id,
	l.code as code,
	l.name as name,
	l.ip as ip,
	l.port as port,
	l.account_number as accountNumber,
	l.password as password
FROM t_server_node l
 ) a 