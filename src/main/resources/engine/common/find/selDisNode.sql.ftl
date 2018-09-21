SELECT
	l.id AS id,
	l.code as code,
	l.name as name,
	l.ip as ip,
	l.port as port,
	l.type as type,
	l.account_number as accountNumber,
	l.password as password,
	dict.name as typeName
FROM t_server_node l
LEFT JOIN t_dict dict on l.type=dict.code and dict.cata_code='t_server_node.type'
