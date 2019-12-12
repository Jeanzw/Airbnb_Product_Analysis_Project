SELECT COUNT(*)  AS ‘total number of users’
FROM (
	SELECT user_id
	FROM data.sessions
	GROUP BY user_id
) new_sessions;