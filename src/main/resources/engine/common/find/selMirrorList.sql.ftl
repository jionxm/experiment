 select * from (
SELECT
	l.id AS id,
	l.mirror as mirror,
	l.mirror_username as mirrorUsername,
	l.mirror_password as mirrorPassword,
	l.cpu as cpu,
	l.memory as memory,
	l.hard_disk as hardDisk
FROM t_mirror l
 ) a 