SELECT
	*
FROM
	(
		SELECT
			l.id AS id,
			l.name AS name,
			l.cata_code AS cataCode,
			l.code
		FROM
			t_dict l
	) a