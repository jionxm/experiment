 select * from (
SELECT
	l.id AS id,
	l.plan_id AS planId,
	l.node_id as nodeId,
	node.code as code,
	node.name as name,
	node.ip as ip,
	node.port as port,
	node.type as type,
	node.account_number as accountNumber,
	node.password as password,
	dict.name as typeName
FROM t_distribution_node l
LEFT JOIN t_server_node node on l.node_id = node.id
LEFT JOIN t_dict dict on node.type=dict.code and dict.cata_code='t_server_node.type'
 ) a 