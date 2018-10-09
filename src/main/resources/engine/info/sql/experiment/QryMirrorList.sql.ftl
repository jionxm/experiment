 select * from (
SELECT
	l.id AS id,
	l.mirror as mirror,
	l.mirror_username as mirrorUsername,
	l.mirror_password as mirrorPassword
FROM t_mirror l
 ) a 