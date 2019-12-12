SELECT COUNT(*)  AS ‘number of active users’
FROM (
	SELECT user_id
	FROM data.sessions
	GROUP BY user_id
	HAVING COUNT(user_id) >= 10
) active;