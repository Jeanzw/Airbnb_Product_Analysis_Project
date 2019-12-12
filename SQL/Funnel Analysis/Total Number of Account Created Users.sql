SELECT COUNT(*) AS ‘sign_up_users_number’
FROM (
	SELECT user_id
	FROM data.sessions
	GROUP BY user_id
) new_sessions
	INNER JOIN data.train_users tu ON new_sessions.user_id = tu.id;