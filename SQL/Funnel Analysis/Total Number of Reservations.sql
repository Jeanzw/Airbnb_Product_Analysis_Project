SELECT COUNT(*) AS ‘reservations_number’
FROM (
	SELECT user_id
	FROM data.sessions
	WHERE action_detail = 'reservations'
	GROUP BY user_id
) booking;