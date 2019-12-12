SELECT COUNT(*) AS ‘pay_numbers’
FROM (
	SELECT user_id
	FROM data.sessions
	WHERE action_detail = 'payment_instruments'
	GROUP BY user_id
) payed;