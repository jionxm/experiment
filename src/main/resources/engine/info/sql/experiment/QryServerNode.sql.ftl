 select * from (
SELECT
	l.id AS id,
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
FROM t_server_node l
 ) a 