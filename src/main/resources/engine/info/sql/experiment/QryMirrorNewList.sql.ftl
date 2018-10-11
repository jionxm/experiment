 select * from (
SELECT
	a.id AS id,
	a.eg_id as egId,
	a.mirror_id as mirrorId,
	l.mirror as mirror,
	l.mirror_username as mirrorUsername,
	l.mirror_password as mirrorPassword,
	a.mirror_num as serverNum
FROM t_experiment_mirror a
LEFT JOIN t_mirror l ON a.mirror_id = l.id
LEFT JOIN t_experiment_eg e ON e.id = a.eg_id
 ) b