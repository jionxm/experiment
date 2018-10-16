 select * from (
SELECT
	exp.id AS id,
	exp.schedule_id as scheduleId,
	l.code as code,
	l.name as name,
	l.ip as ip,
	l.port as port,
	l.account_number as accountNumber,
	l.password as password,
	l.max_memory as maxMemory,
	l.min_domains as minDomains,
	l.max_domains as maxDomains,
	l.domain_storage_pool_src as domainStoragePoolSrc,
	l.emulator
FROM t_experiment_node exp
left join t_server_node l on exp.node_id = l.id
 ) a 