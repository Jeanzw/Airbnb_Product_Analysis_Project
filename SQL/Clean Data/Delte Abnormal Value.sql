#delte users whose age not between 7 and 75 and set then as 0
SET sql_safe_updates = 1;
UPDATE data.train_users
SET age = 0
WHERE id NOT IN (
		SELECT id
		FROM (
			SELECT id
			FROM data.train_users
			WHERE age <= 75
				AND age >= 7
		) a
	);