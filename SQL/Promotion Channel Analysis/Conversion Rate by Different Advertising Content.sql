SELECT first_affiliate_tracked, 
SUM(CASE WHEN date_first_booking <> '0000-00-00 00:00:00' THEN 1 ELSE 0 END) / COUNT(id) AS fat_ratio
FROM data.train_users
GROUP BY first_affiliate_tracked
ORDER BY fat_ratio DESC;