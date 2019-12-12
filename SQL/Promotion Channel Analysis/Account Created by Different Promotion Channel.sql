SELECT affiliate_channel, affiliate_provider, COUNT(id) AS ac_num
FROM data.train_users
GROUP BY affiliate_channel, affiliate_provider
ORDER BY ac_num DESC;