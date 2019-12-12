SELECT first_affiliate_tracked, COUNT(id) AS fat_num
FROM data.train_users
GROUP BY first_affiliate_tracked
ORDER BY fat_num DESC;