SELECT date_format(date_account_created, '%Y-%M') AS year_moth, COUNT(id)
FROM data.train_users
GROUP BY date_format(date_account_created, '%Y-%M')
ORDER BY year_moth;