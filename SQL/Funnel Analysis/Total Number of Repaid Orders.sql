SELECT COUNT(*) AS ‘repay_numbers’
FROM (
	SELECT user_id
	FROM data.sessions
	WHERE action_detail = 'reservations'
	GROUP BY user_id
	HAVING COUNT(user_id) >= 2
) re_booking;