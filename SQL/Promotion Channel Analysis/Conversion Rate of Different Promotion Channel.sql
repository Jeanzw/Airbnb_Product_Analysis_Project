SELECT affiliate_channel, affiliate_provider, 
SUM(CASE WHEN date_first_booking <> '0000-00-00 00:00:00' THEN 1 ELSE 0 END) / COUNT(id) AS ac_ratio
FROM data.train_users
GROUP BY affiliate_channel, affiliate_provider
ORDER BY ac_ratio DESC;